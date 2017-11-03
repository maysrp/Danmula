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

use cmf\controller\UserBaseController;
use app\user\model\CollectionModel;
use app\user\model\VideoModel;
use think\Db;

/**
 * 附件上传控制器
 * Class Asset
 * @package app\asset\controller
 */ 
class CollectionController extends UserBaseController
{
    public function my(){
        $user = cmf_get_current_user();
        $where['uid']=$user['id'];
        $where['del']=0;
        $list=Db::name('collection')->where($where)->paginate(10);
        $this->assign($user);
        $this->assign('list',$list);
        return $this->fetch();
    }
    public function collection(){//此函数在portal中应该要重写
        $cid=$this->request->param('cid',0,'intval');
        $where['del']=0;
        $where['cid']=$cid;
        $rem=Db::name('collection')->where($where)->find();
        $info=json_decode($rem['info'],true);
        $one_info=[];
        $rim['cid']=$cid;
        $rim['name']=$rem['name'];
        $rim['description']=$rem['description'];
        foreach ($info as $xinfo){
            if($ram=is_valid($xinfo)){//只有视频VID
                $one_info['name']=$ram['name'];
                $one_info['vid']=$xinfo;
                $rim['data'][]=$one_info;
            }
        }
        return json($rim);
    }
    public function collection_create(){
        $user = cmf_get_current_user();
        $name=$this->request->param('name');
        if(!$this->uniname($name,$user['id'])){
            $description=$this->request->param('description','');
            $insert['description']=$description;
            $insert['name']=$name;
            $insert['uid']=$user['id'];
            $insert['ctime']=time();
            $re['status']=Db::name('collection')->insertGetId($insert);
        }else{
            $re['status']=false;
        }
        return json($re);
    }
    protected function uniname($name,$uid){//自己重名
        $where['del']=0;
        $where['name']=$name;
        $where['uid']=$uid;  
        return Db::name('collection')->where($where)->find();      
    }
    protected function my_cid($uid,$cid){
        $where['del']=0;
        $where['cid']=$cid;
        $where['uid']=$uid;  
        return Db::name('collection')->where($where)->find();      
    }
    public function collection_delete(){
        $user = cmf_get_current_user();
        $cid=$this->request->param('cid','0','intval');
        $where['del']=0;
        $where['uid']=$user['id'];
        $where['cid']=$cid;
        $update['del']=time();
        $re['status']=Db::name('collection')->where($where)->update($update);
        return json($re);
    }
    // public function collection_cid_add(){
    //     $user = cmf_get_current_user();
    //     $cid=$this->request->param('cid','0','intval');
    // }
    public function collection_change(){
        $user = cmf_get_current_user();
        $info=$this->request->param('info');
        $where['cid']=$this->request->param('cid','0','intval');
        $where['uid']=$user['id'];
        if($info){
            $tag=preg_replace('/\s+/', ' ', $info);
            $ram=explode(" ", $tag);
            $Video=new VideoModel();
            $rem=[];
            foreach($ram as $one){
                if($Video->my_vid($one,$user['id'])){
                    $rem[]=$one;
                }
            }
            $rem=array_unique($rem);
            $update['count']=count($rem);
            $update['info']=json_encode($rem);//应该为本人所有
        }
        if($name=$this->request->param('name')){
            $update['name']=$name;
        }
        if($description=$this->request->param('description')){
            $update['description']=$description;
        }
        $update['utime']=time();
        $re['status']=Db::name('collection')->where($where)->update($update);
        $re['con']=Db::name('collection')->where($where)->find();
        return json($re);
    }


}