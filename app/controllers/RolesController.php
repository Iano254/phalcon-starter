<?php
declare(strict_types=1);

class RolesController extends ControllerBase
{

	public function initialize()
	{
		$this->view->setTemplateAfter('admin');
	}

    public function indexAction()
    {
    	$query = 'select * from roles';
        $roles = $this->db->query($query, [])->fetchAll();

        $query = 'select * from permissions';
        $permissions = $this->db->query($query, [])->fetchAll();

        $this->view->setVars(['roles' => $roles, 'permissions' => $permissions]);

        if($this->request->isPost()){
            $name = $this->request->getPost('name');
            $permissions = $this->request->getPost('permissions');

            $uuid = $this->gen_uuid();
            $params = [
                'name' => $name,
                'log_id' => $uuid,
                'permissions' => json_encode($permissions),
                'created_at' => date('Y-m-d H:i:s')
            ];
            $table = 'roles';
            $success = $this->db->insertAsDict($table,$params);

            if($success){
                    $this->flashSession->success('Operation successful');
            }else{
                $this->flashSession->error('Operation failed');
            }

            return $this->back();

        }
    }



    public function permissionsAction($action, $log_id = null)
    {
        $query = 'select * from permissions';
        $permissions = $this->db->query($query, [])->fetchAll();

        $this->view->setVars(['permissions' => $permissions]);

        if($action == 'add'){
            if($this->request->isPost()){

                $permission = $this->request->getPost('name');
                $uuid = $this->gen_uuid();
                $params = ["name" => $permission, "log_id" => $uuid, "updated_at" => date('Y-m-d H:i:s') ];

                $success = $this->db->insertAsDict("permissions",$params);

                if($success){
                    $this->flashSession->success('Operation successful');
                }else{
                    $this->flashSession->error('Operation failed');
                }

                return $this->back();
            }
        }
        if($action == 'delete'){
            $query = 'delete from permissions where log_id = ? limit 1';
            $success = $this->runSQL($query, [$log_id]);

            if($success){
                    $this->flashSession->success('Operation successful');
            }else{
                $this->flashSession->error('Operation failed');
            }

            return $this->back();

        }
        
        
    }

    public function editAction($log_id)
    {
        if($this->request->isPost()){

            $name = $this->request->getPost('role_name');
            $permissions = $this->request->getPost('permissions');

            $params = ["name" => $name, 'permissions' => json_encode($permissions), "updated_at" => date('Y-m-d H:i:s') ];

            $success = $this->db->updateAsDict("roles",$params, "log_id = '$log_id'");

            if($success){
                $this->flashSession->success('Operation successful');
            }else{
                $this->flashSession->error('Operation failed');
            }

            return $this->back();
        }
    }

    public function deleteAction($log_id)
    {
        $query = 'delete from roles where log_id = ? limit 1';
        $success = $this->runSQL($query, [$log_id]);

        if($success){
                $this->flashSession->success('Operation successful');
        }else{
            $this->flashSession->error('Operation failed');
        }

        return $this->back();
    }


   
}

