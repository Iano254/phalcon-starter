<?php
declare(strict_types=1);

class IndexController extends ControllerBase
{

	public function initialize()
	{
		$this->view->setTemplateAfter('admin');
	}

    public function indexAction()
    {
    	return $this->response->redirect('/dashboard');
    }

    

}

