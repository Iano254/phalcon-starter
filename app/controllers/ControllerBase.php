<?php
declare(strict_types=1);

use Phalcon\Mvc\Controller;
use Phalcon\Logger;
use Phalcon\Logger\Adapter\Stream;
use Phalcon\Http\Response;

class ControllerBase extends Controller
{
    
    public function initialize(){
        date_default_timezone_set('Africa/Nairobi');

    }

    public function back()
    {
        return $this->response->redirect($_SERVER['HTTP_REFERER']);
    }
    // Implement common logic
    public function beforeExecuteRoute(){
        $uri = $_SERVER['REQUEST_URI']; 
    	
        $LOGIN_ROUTES = ['/auth', '/auth/login', '/auth/forgot', '/auth/reset'];
        $uri = $_SERVER['REQUEST_URI'];
        //print_r($uri);
        if (!in_array($uri, $LOGIN_ROUTES)) {
            $this->checkAuth($uri);
            $permissions = [];
            $role = $this->session->get('role');
            if($role != null){
                $permissions = json_decode($role['permissions']);
            }

            $this->view->setVars(['user_permissions' => $permissions]);
        }else{

        }
        
    }

    public function json_response($payload)
    {
        $response = new Response();
        $response->setStatusCode(200, "OK");
        $response->setHeader("Content-Type", "application/json");
        $response->setHeader("Access-Control-Allow-Origin", "*");


        $response->setContent(json_encode($payload));

        return $response;
    }

    public static function slugify($text)
    {
      // replace non letter or digits by -
      $text = preg_replace('~[^\pL\d]+~u', '-', $text);

      // transliterate
      $text = iconv('utf-8', 'us-ascii//TRANSLIT', $text);

      // remove unwanted characters
      $text = preg_replace('~[^-\w]+~', '', $text);

      // trim
      $text = trim($text, '-');

      // remove duplicate -
      $text = preg_replace('~-+~', '-', $text);

      // lowercase
      $text = strtolower($text);

      if (empty($text)) {
        return 'n-a';
      }

      return $text;
    }

    public function error_logger($message){
        // file_put_contents('./log_'.date("j.n.Y").'.log', date('Y-m-d H:i:s')." Log: ".$message.PHP_EOL, FILE_APPEND);
        $adapter = new Stream('./log_'.date("j.n.Y").'.log');
        $logger  = new Logger(
            'messages',
            [
                'main' => $adapter,
            ]
        );
        
        return $logger->error($message);
    }
    public function info_logger($message){
        // file_put_contents('./log_'.date("j.n.Y").'.log', date('Y-m-d H:i:s')." Log: ".$message.PHP_EOL, FILE_APPEND);
        $adapter = new Stream('./log_'.date("j.n.Y").'.log');
        $logger  = new Logger(
            'messages',
            [
                'main' => $adapter,
            ]
        );
        
        return $logger->info($message);
    }


    public function postToUrl($data, $url) {
        $encodedData = json_encode($data);
        $httpRequest = curl_init($url);
        curl_setopt($httpRequest, CURLOPT_NOBODY, true);
        curl_setopt($httpRequest, CURLOPT_POST, true);
        curl_setopt($httpRequest, CURLOPT_POSTFIELDS, $encodedData);
        curl_setopt($httpRequest, CURLOPT_TIMEOUT, 30); //timeout after 30 seconds
        curl_setopt($httpRequest, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($httpRequest, CURLOPT_HTTPHEADER, array('Content-Type: application/json', 'Content-Length: ' . strlen($encodedData)));
        curl_setopt($httpRequest, CURLOPT_HTTPAUTH, CURLAUTH_ANY);
        $results = curl_exec($httpRequest);
        $status_code = curl_getinfo($httpRequest, CURLINFO_HTTP_CODE); //get status code
        curl_close($httpRequest);
        $response = ["status_code" => $status_code, "message" => $results];
        return [$status_code, $results];
    }

    public function checkAuth($next)
    {
    	$user = $this->session->get('user');
    	if(empty($user) || $user == null){
    		$this->session->set('next', $next);
    		return $this->response->redirect('/auth/login');
    		exit;
    	}
        $this->view->setVars(['user' =>  $this->session->get('user')]);
    }

    public function formatMobile($phone){
        $regex = '/^(?:\+?(?:[1-9]{3})|0)?7([0-9]{8})$/';
        $regex2 = '/^(?:\+?(?:[1-9]{3})|0)?1([0-9]{8})$/';


        if (preg_match_all($regex, $phone, $capture)) {
            $phone = '2547' . $capture[1][0];
        }else if(preg_match_all($regex2, $phone, $capture)){
            $phone = '2541' . $capture[1][0];
        } else {
            $phone = false;
        }

        return $phone;
    }

    public function fetchOne($sql, $params)
	{

        $course = $this->db->query($sql,$params);
        // echo "Query: ".$sql." params: ".json_encode($params);
        $res= $course->fetch();

        return $res;
	}

	public function fetchMany($sql, $params){
		$success = $this->db->query($sql, $params);
		$results = $success->fetchAll();

		return $results;
	}

	public function updateRecord($table, $params)
	{

        $success = $this->db->execute(
            $sql,
            $params
        );
       

        return $success;

	}
	public function runSQL($sql, $params)
	{
        $success = $this->db->execute(
            $sql,
            $params
        );
        
        return $success;
	}
	public function insertRecord($table, $params){
		$result = $this->db->insertAsDict(
		    $table,
		    $params
		);

		return $result;
	}

    public function gen_uuid() {
        return sprintf( '%04x%04x-%04x-%04x-%04x-%04x%04x%04x',
        // 32 bits for "time_low"
        mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ),

        // 16 bits for "time_mid"
        mt_rand( 0, 0xffff ),

        // 16 bits for "time_hi_and_version",
        // four most significant bits holds version number 4
        mt_rand( 0, 0x0fff ) | 0x4000,

        // 16 bits, 8 bits for "clk_seq_hi_res",
        // 8 bits for "clk_seq_low",
        // two most significant bits holds zero and one for variant DCE1.1
        mt_rand( 0, 0x3fff ) | 0x8000,

        // 48 bits for "node"
        mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff )
        );
    }


}
