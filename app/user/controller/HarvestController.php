<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: Powerless < wzxaini9@gmail.com>
// +----------------------------------------------------------------------

namespace app\user\controller;

use cmf\controller\UserBaseController;
use think\Db;
use app\user\model\HarvestModel;
use app\user\model\VideoModel;

/**
 * Class AdminIndexController
 * @package app\user\controller
 *
 * @adminMenuRoot(
 *     'name'   =>'用户管理',
 *     'action' =>'default',
 *     'parent' =>'',
 *     'display'=> true,
 *     'order'  => 10,
 *     'icon'   =>'group',
 *     'remark' =>'用户管理'
 * )
 *
 * @adminMenuRoot(
 *     'name'   =>'用户组',
 *     'action' =>'default1',
 *     'parent' =>'user/AdminIndex/default',
 *     'display'=> true,
 *     'order'  => 10000,
 *     'icon'   =>'',
 *     'remark' =>'用户组'
 * )
 */
class HarvestController extends UserBaseController{
    public function my(){
        $user = cmf_get_current_user();
        $this->assign($user);
        $Harvest=new HarvestModel();
        $where['uid']=$user['id'];
        $where['del']=0;
        $list=$Harvest->where($where)->paginate(10);
        $this->assign('list',$list);
        return $this->fetch();
    }
    public function harvest_add(){
        $user = cmf_get_current_user();
        if($user['id']){
            $get=$this->request->param();
            $Harvest=new HarvestModel();
           
            switch ($get['type']){
                case 'video':
                    $Video=new VideoModel();
                    if($Video->vid($get['xid'])){
                        $insert['xid']=$get['xid'];//用XID 统一
                        $insert['uid']=$user['id'];
                        $insert['type']='video';
                        $insert['del']=0;
                        if($Harvest->where($insert)->find()){
                            $update['del']=time();
                            $Harvest->where($insert)->update($update);
                            $re['status']=2;
                            $re['con']="已经删除收藏";
                            
                            $vw['vid']=$get['xid'];
                            $vw['del']=0;

                            Db::name('video')->where($vw)->setDec('harvest');
                            return json($re);
                        }else{
                            $vw['vid']=$get['xid'];
                            $vw['del']=0;
                            
                            $insert['name']=isset($get['name'])?$get['name']:'';
                            $insert['time']=time();
                            $re['status']=$Harvest->insert($insert);
                            Db::name('video')->where($vw)->setInc('harvest');
                            return json($re);
                        }
                       
                    }else{
                        $re['status']=false;
                        $re['con']="无该视频";
                        return json($re);//没有登入用户 **
                    }
                break;
                // POST EVEBNT
                default:
                // 加内容?
                break;
            }
        }else{
            $re['status']=false;
            $re['con']="请先登入";
            return json($re);//没有登入用户 **
        }        
    }
    // public function harvest_del(){
    //     $user = cmf_get_current_user();
    //     if($user['id']){
    //         $get=$this->request->paramt();
    //         $where['xid']=$get['xid'];
    //         $where['type']=$get['type'];
    //         $where['del']=0;
    //         $Harvest=new HarvestModel();
    //         $update['del']=time();
    //         if($Harvest->where($where)->update($update)){
    //             $re['status']=true;
    //             return $re;
    //         }else{
    //             $re['status']=false;
    //             return $re;
    //         }            
    //     }else{
    //         $re['status']=false;
    //         return $re;
    //     }
    // }
    public function harvest_del(){
        $user = cmf_get_current_user();
        $hid=$this->request->param('hid',0,'intval');
        $where['del']=0;
        $where['hid']=$hid;
        $where['uid']=$user['id'];
        $update['del']=time();
        if($re['status']=Db::name('harvest')->where($where)->update($update)){
            $re['con']='已经删除';
        }else{
            $re['con']='删除失败';
        }       
        return json($re);
    }
}