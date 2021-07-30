<?php
declare(strict_types=1);

class ProfileController extends ControllerBase
{

	public function initialize()
	{
		$this->view->setTemplateAfter('admin');
	}

    public function indexAction()
    {
    	
        $user = $this->session->get('user');
    	$this->view->setVars(['user' => $user]); 

        if($this->request->isPost()){
           $full_name = $this->request->getPost('full_name');
           $password = $this->request->getPost('password');
           $password_confirmation = $this->request->getPost('password2');
           $msisdn = $this->request->getPost('msisdn');
           $id = $user['id'];

           if($password != null && $password != ""){

                if($password != $password_confirmation){
                    $this->flashSession->error("Passwords dont match");
                    return $this->back();
                }
                $password_hash = $this->security->hash($password);
                $this->db->updateAsDict("users", ["password" => $password_hash], "id = $id ");
           }

           $msisdn = $this->formatMobile($msisdn);
           if($msisdn == false){
            $this->flashSession->error('Invalid Phone Number');
            return $this->back();
           }

           $this->db->updateAsDict("users", ["full_name" => $full_name, "msisdn" => $msisdn], "id = $id ");
           $query = "select * from users where id = ? limit    1";
           $user = $this->fetchOne($query, [$id]);
           $this->session->set("user", $user);
           $this->flashSession->success("Operation successful");
           return $this->back();


        }
        
        return;
    }

    

}

