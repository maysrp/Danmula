<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 老猫 <thinkcmf@126.com>
// +----------------------------------------------------------------------
namespace app\portal\controller;

use cmf\controller\HomeBaseController;
use think\Db;

class SearchController extends HomeBaseController
{
    public function index()
    {
        $keyword = $this->request->param('keyword');
        if (empty($keyword)) {
            $this -> error("关键词不能为空！请重新输入！");
        }
        $get=$this->request->get();
        $board=isset($get['board'])?$get['board']:[1];


        $where['board']=['in',$board];
        $where['name']=['like','%'.$keyword.'%'];
        $where['checked']=['>',1];
        $where['del']=0;

        
        $list=Db::name('video')->where($where)->paginate(10);
        $this->assign('list',$list);
        $info['board']=$board;
        $info['keyword']=$keyword;
        $this->assign('info',$info);
        return $this->fetch('/search');
    }
}
