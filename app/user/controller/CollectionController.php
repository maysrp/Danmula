<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: kane <chengjin005@163.com>
// +----------------------------------------------------------------------
namespace app\user\controller;

use cmf\controller\AdminBaseController;
use app\user\model\CollectionModel;
use think\Db;

/**
 * 附件上传控制器
 * Class Asset
 * @package app\asset\controller
 */
class CollectionController extends AdminBaseController
{
    public function my(){
        $user = cmf_get_current_user();
        $list=Db::name('collection')->where($where)->paginate(10);
        $this->assign('list',$list);
        return $this->fetch();
    }
    public function one(){
        $cid=$this->request->param('cid',0,'intval');
    }


}