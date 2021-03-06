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
namespace app\admin\controller;
use app\user\model\VideoModel;
use app\user\model\GoodModel;
use app\user\model\HarvestModel;
use app\user\model\WatchModel;
use app\user\model\PhotoModel;
use cmf\controller\AdminBaseController;
use think\Db;
/**
 * 百度编辑器文件上传处理控制器
 * Class Ueditor
 * @package app\asset\controller
 */
class VideoController extends  AdminBaseController
{
    
    public function index(){
        
        
        $Video=new VideoModel();
        $where['del']=0;
        $list=$Video->where($where)->paginate(20);
        $this->assign('list',$list);
        return $this->fetch();
    }
    
    public function video(){
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
            // if($user['id']!=$info['uid']){
            //     $this->assign($user);
            //     return $this->fetch('error');
            // }
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
        	return $this->error('不存在该视频');
        }
    }
   
    public function del(){
        $vid=$this->request->param('vid',0,'intval');
        $Video=new VideoModel();
        $where['del']=0;
        $where['vid']=$vid;
        $update['del']=time();
        if($Video->where($where)->update($update)){
            $re['status']=true;
        }else{
            $re['status']=false;
        }
        return json($re);
    }
    public function edit(){
           
        $vid=$this->request->param('vid',0,'intval');
        
        $Video=new VideoModel();
        $Harvest=new HarvestModel();
        $Good=new GoodModel();
        $Watch=new WatchModel();
        $Photo=new PhotoModel();
        $info=$Video->vid($vid);
        if($info){
            
        	$rem['xid']=$vid;
        	$rem['type']='video';
        	$info['good']=$Good->good_count($rem);
        	$info['bad']=$Good->bad_count($rem);
        	$info['harvest']=$Harvest->harvest_count($rem);
        	$info['watch']=$Watch->watch_count($rem);
        	$info['photo']=$Photo->photo_get($rem);
            
            $info['video']=cmf_get_file_download_url($info['video'],3000);
    
        	$this->assign('info',$info);
        	return $this->fetch();
        }else{
           
        	return $this->error('无该视频');
        }
    }
    public function edit_do(){
        $post=$this->request->post();
        $Video=new VideoModel();
        $vid=isset($post['vid'])?(int)$post['vid']:0;
        if($Video->vid($vid)){
            $update['vid']=$post['vid'];
            $update['utime']=time();
            $update['name']=$post['name'];
            $update['description']=$post['description'];
            $update['board']=$this->request->param('board',1,'intval');
            $update['checked']=time();
            // $update['checked']=0;先不审核
            if($Video->update($update)){
                $this->redirect(url('admin/video/video',['vid'=>$post['vid']]));
            }else{
                $this->error('修改失败');
            }
        }else{
            return $this->error('修改失败');
        }
    }
    public function checked(){
        $where['vid']=$this->request->param('vid',0,'intval');
        $checked=$this->request->param('checked',0,'intval');
        if($checked>1){
            $update['checked']=time();
        }elseif($checked==1){
            $update['checked']=1;
        }else{
            $update['checked']=0;
        }
        $re['status']=Db::name('video')->where($where)->update($update);
        if($re['status']&&$update['checked']>1){
            $dat=Db::name('video')->where($where)->find();
            point_checked($dat['uid']);
        }
        return json($re);
    }
}