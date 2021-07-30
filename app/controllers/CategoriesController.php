<?php
declare(strict_types=1);

class CategoriesController extends ControllerBase
{

	public function initialize()
	{
		$this->view->setTemplateAfter('admin');
        $this->tag->setTitle('| Dashboard');
	}

    public function indexAction()
    {

        $query = "select * from categories";
        $categories = $this->fetchMany($query, []);
        
        $this->view->setVars(['categories' => $categories]);

        if($this->request->isPost()){
            $this->info_logger("Trying to create category");
            $name = $this->request->getPost('name');
            $description = $this->request->getPost('description');

            try {
                $params = array('name' => $name, 'log_id' => $this->gen_uuid(), 'description' => $description, 'slug' => $this->slugify($name), 'created_at' => date('Y-m-d H:i:s') );
                $success = $this->db->insertAsDict('categories',$params);
                if($success){
                    $this->flashSession->success("Operation Successful");
                }else{
                    $this->flashSession->error("Operation failed");
                }
                
            } catch (Exception $e) {
                $this->error_logger($e->getMessage());
                $this->flashSession->error($e->getMessage());
            }

            return $this->back();
        }


        
    }

    public function apiAction()
    {
        $query = "select * from categories";
        $categories = $this->fetchMany($query, []);

        return $this->json_response($categories);
    }

    
}