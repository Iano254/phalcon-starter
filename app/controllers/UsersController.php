<?php
declare(strict_types=1);

class UsersController extends ControllerBase
{

	public function initialize()
	{
		$this->view->setTemplateAfter('admin');
	}

    public function indexAction()
    {
    	$users_sql = 'select users.*, roles.name as role_name, roles.id as role_id from users inner join roles on users.role = roles.id ';
    	$users = $this->fetchMany($users_sql, []);

    	$this->view->setVars(['users' => $users]);
        $sql = 'select * from roles ';
        $roles = $this->fetchMany($sql, []);

        $this->view->setVars(['roles' => $roles]);
    }

    public function newAction()
    {
        $sql = 'select * from roles ';
        $roles = $this->fetchMany($sql, []);

        $this->view->setVars(['roles' => $roles]);
    	if($this->request->isPost()){



    		$full_name = $this->request->getPost('full_name');
    		$phone = $this->request->getPost('phone');
    		$password = $this->request->getPost('password');
            $role = $this->request->getPost('role');

    		if($full_name == "" || $phone == ""){
    			$this->flashSession->error("Fill all required fields");
    			return $this->response->redirect($_SERVER['HTTP_REFERER']);
    		}

    		$regex = '/^(?:\+?(?:[1-9]{3})|0)?7([0-9]{8})$/';
		    $regex2 = '/^(?:\+?(?:[1-9]{3})|0)?1([0-9]{8})$/';


	    	if (preg_match_all($regex, $phone, $capture)) {
	            $phone = '2547' . $capture[1][0];
	        }else if(preg_match_all($regex2, $phone, $capture)){
	            $phone = '2541' . $capture[1][0];
	        } else {
	            $phone = false;
	        }

	        if($phone == false){
	        	$this->flashSession->error('Invalid phone number format');
	    		return $this->response->redirect($_SERVER['HTTP_REFERER']);
	    		exit;
	        }
            // check if phone number exists
            $_phone_exists_sql = 'select * from users where msisdn = ?';
            $_existsing_phone = $this->fetchMany($_phone_exists_sql, [$phone]);
            if(!empty($_existsing_phone)){
                $this->flashSession->error('A user with this phone number already exists');
                return $this->response->redirect($_SERVER['HTTP_REFERER']);
                exit;
            }

    		$password_hash = $this->security->hash($password);
            $uuid = $this->gen_uuid();

    		// Input the data
            $params = [
                'full_name' => $full_name,
                'password' => $password_hash,
                'msisdn' => $phone,
                'role' => $role,
                'log_id' => $uuid
            ];
            $table = 'users';
    		$auth = $this->db->insertAsDict($table,$params);
           

            
    		if($auth){
    			$this->flashSession->success('User added successfully');
    			return $this->response->redirect('/users');
    		}
    	}
    }



    public function editAction($id)
    {
        if($this->request->isPost()){
           $full_name = $this->request->getPost('full_name');
           $password = $this->request->getPost('password');
           $role = $this->request->getPost('role');


           if($password != null && $password != ""){
                $password_hash = $this->security->hash($password);
                $this->db->updateAsDict("users", ["password" => $password_hash], "id = $id ");
           }

           $this->db->updateAsDict("users", ["full_name" => $full_name, "role" => $role], "id = $id ");

           $this->flashSession->success("Operation successful");
           return $this->back();


        }
        
        return;
    }

    

}

