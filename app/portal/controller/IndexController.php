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
            $board=$this->exboard(1);
        }else{
            $board=$this->exboard(0);
        }
        $rem=[];
        foreach($board as $bo){
            $where['del']=0;
            $where['board']=$bo['id'];
            $xin=$Video->where($where)->order('checked desc')->limit(8)->select();//最新剧集
            $ram['new']=$xin->toArray();
            $ram['name']=board($bo['id']);
            $ram['board']=$bo['id'];
            $rem[]=$ram;
        }
        $this->assign('info',$rem);

        return $this->fetch(':index');
    }
    protected function exboard($type=0){
        $Board=new boardModel();
        if(!$type){
            $where['is_login']=0;            
        }
        $where['del']=0;
        $info=$Board->where($where)->order('sort')->select();
        return $info->toArray();

    }
}
