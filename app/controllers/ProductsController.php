<?php
declare(strict_types=1);

class ProductsController extends ControllerBase
{

	public function initialize()
	{
		$this->view->setTemplateAfter('admin');
        $this->tag->setTitle('| Dashboard');
	}

    public function indexAction()
    {
        $permissions = [];
        $role = $this->session->get('role');
        if($role != null){
            $permissions = json_decode($role['permissions']);
        }
        
        $this->view->setVars([]);
        
    }

    
}