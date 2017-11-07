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
use think\Db;

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
            $where['checked']=['>',1];
            $xin=$Video->where($where)->order('ctime desc')->limit(8)->select();//最新剧集
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
    public function board(){
        $user = cmf_get_current_user();
        $where['board']=$this->request->param('board',1,'intval');

        $whereb['id']=$where['board'];
        $whereb['del']=0;
        if(!$user){
            $whereb['is_login']=0;
        }
        $cv=Db::name('board')->where($whereb)->find();
        if($cv){
            
            $where['del']=0;
            $list=Db::name('video')->where($where)->paginate(20);
            $this->assign('list',$list);
            $this->assign('board',$cv);
            return $this->fetch(':board');

        }else{
            $this->error('不存在该模板');
        }

        
        
    }
}
