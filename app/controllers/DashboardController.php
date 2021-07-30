<?php
declare(strict_types=1);

class DashboardController extends ControllerBase
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

        $query = "select products.*, categories.name as category_name from products inner join categories on products.category = categories.id order by id desc";
        $products = $this->fetchMany($query, []);

        $query = "select count(*) as count from categories ";
        $categories_count = $this->fetchOne($query, []);

        
        $this->view->setVars(['products' => $products, 'categories_count' => $categories_count]);
        
    }

    
}