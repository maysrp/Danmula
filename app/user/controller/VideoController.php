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

use cmf\controller\HomeBaseController;


/**
 * 百度编辑器文件上传处理控制器
 * Class Ueditor
 * @package app\asset\controller
 */
class VideoController extends HomeBaseController
{
    public function up_video(){
        $user = cmf_get_current_user();
        $this->assign($user);//用于和前台一起判断是否已经登入 :  <title>{$user_login} - 视频上传</title>
        return $this->fetch('upload');
    }
    public function index(){
        $vid = $this->request->param('vid', 1, 'intval');
        $this->redirect('portal/Video/index',['vid'=>$vid]);
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
                var_dump($info);
                
                $Video=new VideoModel();

                $xinfo=$Video->upload($info);
                var_dump($xinfo);
                
        
             }
        }
    }
}