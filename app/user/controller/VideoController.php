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

use app\user\model\VideoModel;
use app\user\model\GoodModel;
use app\user\model\HarvestModel;
use app\user\model\WatchModel;
use app\user\model\PhotoModel;

use cmf\controller\UserBaseController;


/**
 * 百度编辑器文件上传处理控制器
 * Class Ueditor
 * @package app\asset\controller
 */
class VideoController extends UserBaseController
{
    public function up_video(){
        $user = cmf_get_current_user();
        $this->assign($user);
        return $this->fetch('upload');
    }
    public function index(){
        $user = cmf_get_current_user();
        $vid = $this->request->param('vid', 1, 'intval');
        //$this->redirect('portal/Video/index',['vid'=>$vid]);
        $Video=new VideoModel();
        $Harvest=new HarvestModel();
        $Good=new GoodModel();
        $Watch=new WatchModel();
        $Photo=new PhotoModel();

        $info=$Video->vid($vid);
        if($info){
            if($user['id']!=$info['uid']){
                $this->assign($user);
                return $this->fetch('error');
            }
        	$rem['xid']=$vid;
        	$rem['type']='video';
        	$info['good']=$Good->good_count($rem);
        	$info['bad']=$Good->bad_count($rem);
        	$info['harvest']=$Harvest->harvest_count($rem);
        	$info['watch']=$Watch->watch_count($rem);
        	$info['photo']=$Photo->photo_get($rem);
            
            $info['video']=cmf_get_file_download_url($info['video'],3000);
    
            $this->assign($user);
        	$this->assign('info',$info);
        	return $this->fetch('play');
        }else{
            $this->assign($user); 
        	return $this->fetch('error');
        }
    }
    public function upload_video(){
        $file=$this->request->file('video');
        if($file){
             $upinfo = $file->validate(['size'=>1024000000,'ext'=>'mp4'])->move(ROOT_PATH . 'public/upload/video');
             if($upinfo){
                $info['video']='video/'.$upinfo->getSaveName();//存储在Video 相对于upload的位置
                $info['name']=$this->request->post('name','unknow');
                $info['description']=$this->request->post('description','unknow');
                $info['uid']=cmf_get_current_user_id();
                
                
                $Video=new VideoModel();

                if($xinfo=$Video->upload($info)){
                    $re['status']=1;
                    $re['con']=$xinfo;
                }else{
                    $re['status']=0;
                }
             }else{
                $re['status']=0;
             }
        }else{
            $re['status']=0;
        }
        return json($re);
    }
    public function my(){
        $user = cmf_get_current_user();
        $this->assign($user);
        
        $Video=new VideoModel();
        $where['uid']=$user['id'];
        $where['del']=0;
        $list=$Video->where($where)->paginate(10);
        $this->assign('list',$list);
        return $this->fetch();
    }
    public function del(){
        $user = cmf_get_current_user();
        $uid=$user['id'];        
        $vid=$this->request->param('vid',0,'intval');
        $Video=new VideoModel();
        if($Video->del_my($vid,$uid)){
            $re['status']=true;
        }else{
            $re['status']=false;
        }
        return json($re);
    }
    public function edit(){
        $user = cmf_get_current_user();
        $uid=$user['id'];        
        $vid=$this->request->param('vid',0,'intval');
        
        $Video=new VideoModel();
        $Harvest=new HarvestModel();
        $Good=new GoodModel();
        $Watch=new WatchModel();
        $Photo=new PhotoModel();

        $info=$Video->vid($vid);
        if($info){
            if($user['id']!=$info['uid']){
                $this->assign($user);
                return $this->fetch('error');
            }
        	$rem['xid']=$vid;
        	$rem['type']='video';
        	$info['good']=$Good->good_count($rem);
        	$info['bad']=$Good->bad_count($rem);
        	$info['harvest']=$Harvest->harvest_count($rem);
        	$info['watch']=$Watch->watch_count($rem);
        	$info['photo']=$Photo->photo_get($rem);
            
            $info['video']=cmf_get_file_download_url($info['video'],3000);
    
            $this->assign($user);
        	$this->assign('info',$info);
        	return $this->fetch();
        }else{
            $this->assign($user); 
        	return $this->fetch('error');
        }
    }
    public function edit_do(){
        $post=$this->request->post();
        $user = cmf_get_current_user();
        $Video=new VideoModel();
        if($Video->my_vid($post['vid'],$user['id'])){
            $update['vid']=$post['vid'];
            $update['utime']=time();
            $update['name']=$post['name'];
            $update['description']=$post['description'];
            $update['checked']=0;
            if($Video->update($update)){
                $this->redirect(url('video/index',['vid'=>$post['vid']]));
            }else{
                $this->error('修改失败');
            }

        }else{
            return $this->fetch('error');
        }

    }
}