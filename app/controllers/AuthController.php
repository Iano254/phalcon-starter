<?php
declare(strict_types=1);

class AuthController extends ControllerBase
{

	public function initialize()
	{
		// $this->view->setTemplateAfter('admin');
	}

    public function indexAction()
    {

    }

    public function loginAction()
    {
        
        if($this->request->isPost()){
            $login = $this->request->getPost('login');
            $password = $this->request->getPost('password');

            $phone = $this->formatMobile($login);

            if($phone == false){
                $this->flashSession->error('Invalid phone number');
                return $this->back();
            }

            $query = 'select * from users where msisdn = ? limit 1';
            $user = $this->fetchOne($query, [$phone]);

            if(empty($user)){
                $this->flashSession->error('User not found');
                return $this->back();
            }

            
            $check = $this
                ->security
                ->checkHash($password, $user['password']);

            if($check){
                $query = 'select * from roles where id = ? limit 1';
                $role = $this->fetchOne($query, [$user['role']]);

                $session = $this->session->set('user', $user);
                $this->session->set('role', $role);
                return $this->response->redirect('/dashboard');
            }else{
                $this->flashSession->error('Incorrect Username/Password');
                return $this->back();
            }
        }

            
       
    }

    public function logoutAction()
    {
        $this->session->destroy();

        $this->response->redirect('/');
    }
    public function forgotAction()
    {
        if($this->request->isPost()){
            $login = $this->request->getPost('phone');

            $phone = $this->formatMobile($login);

            if($phone == false){
                $this->flashSession->error('Invalid phone number');
                return $this->back();
            }
            $query = 'select * from users where msisdn = ? limit 1';
            $user = $this->fetchOne($query, [$phone]);

            if(empty($user)){
                $this->flashSession->error('User not found');
                return $this->back();
            }
            
            $sms_code = rand(1111,9999);
            $sms_code = strval($sms_code);
            $log_id = $user['log_id'];

            $params = ["sms_code" => $sms_code];
            $success = $this->db->updateAsDict("users",$params, "log_id = '$log_id'");

            $message = "Your password reset code is: ".$sms_code;
            $data = array( "recipients" => [$user['msisdn']], "message" => $message);     
            $url = "https://api.surebids.co.ke/sms/send";
            // list($status_code, $response) = $this->postToUrl($data, $url);

            return $this->response->redirect('/auth/reset');
        }
    }

    public function resetAction(){
        if($this->session->get('user')){
            return $this->response->redirect('/');
        }
        if($this->request->isPost()){
            $login = $this->request->getPost('phone');
            $sms_code = $this->request->getPost('code');
            $password = $this->request->getPost('password');
            $password2 = $this->request->getPost('password2');

            $phone = $this->formatMobile($login);

            if($phone == false){
                $this->flashSession->error('Invalid phone number');
                return $this->back();
            }
            $query = 'select * from users where msisdn = ? and sms_code = ? limit 1';
            $user = $this->fetchOne($query, [$phone, $sms_code]);

            if(empty($user)){
                $this->flashSession->error('Invalid Password reset code');
                return $this->back();
            }
            $log_id = $user['log_id'];
            if($password != $password2){
                $this->flashSession->error('Passwords dont match');
                return $this->back();
            }

            $password_hash = $this->security->hash($password);
            $params = ["password" => $password_hash];
            $success = $this->db->updateAsDict("users",$params, "log_id = '$log_id'");

            $this->flashSession->success('Password reset successful.');
            return $this->response->redirect('/auth/login');
        }
    }

}

