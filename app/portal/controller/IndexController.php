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
use app\user\model\VideoModel;
use app\user\model\BoardModel;

class IndexController extends HomeBaseController
{
    public function index()
    {
        $Video=new VideoModel();
        $user = cmf_get_current_user();
        if($user){
            $board=$this->board(1);
        }else{
            $board=$this->board(0);
        }
        $rem=[];
        foreach($board as $bo){
            $where['del']=0;
            $where['board']=$bo['id'];
            $xin=$Video->where($where)->order('checked desc')->select();//最新剧集
            $ram['new']=$xin;
            $rem[]=$ram;
        }
        $this->assign('info',$ram);

        return $this->fetch(':index');
    }
    protected function board($type=0){
        $Board=new boardModel();
        if(!$type){
            $where['is_login']=0;            
        }
        $where['del']=0;
        return $Board->where($where)->order('sort')->select();

    }
}
