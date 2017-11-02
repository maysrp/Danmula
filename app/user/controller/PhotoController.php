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

use think\Db;
use app\user\model\PhotoModel;

use cmf\controller\UserBaseController;


/**
 * 百度编辑器文件上传处理控制器
 * Class Ueditor
 * @package app\asset\controller
 */
class PhotoController extends UserBaseController
{
    public function upload(){
        $file=$this->request->file('image');
        $info['xid']=$this->request->param('xid',0,'intval');
        $info['type']=$this->request->param('type','video');
        $user = cmf_get_current_user();
        $info['uid']=$user['id'];
        if($file&&$user['id']){
            $upinfo = $file->validate(['size'=>60241024,'ext'=>'jpg,png,gif'])->move(ROOT_PATH . 'public/upload/image');
            if($upinfo){
                $info['url']='image/'.$upinfo->getSaveName();//存储在Video 相对于upload的位置
                $update['del']=time();
                $iwhere['xid']=$info['xid'];
                $iwhere['type']=$info['type'];
                Db::name('Photo')->where($iwhere)->update($update);
                $re['status']=Db::name('Photo')->insert($info);
            }else{
                $re['status']=false;
            }
    
        }else{
            $re['status']=false;
        }
        return json($re);    
    }

}