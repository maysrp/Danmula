<?php
    use think\Db;
    function test(){
        echo 'hi';
    }
    function vid_name($vid){
        $where['vid']=$vid;
        $where['del']=0;
        $info=Db::name('video')->where($where)->find();
        if($info){
            return $info['name'];
        }else{
            return "不存在该内容";
        }
    }
    function is_harvest($xid,$type){
        $user = cmf_get_current_user();
        $where['xid']=$xid;
        $where['type']=$type;
        $where['del']=0;
        $where['uid']=$user['id'];
        if(Db::name('harvest')->where($where)->find()){
            return 'text-danger';
        }else{
            return 'text-success';
        }
    }
    function hid_name($hid){
        $where['del']=0;
        $where['hid']=$hid;
        if($info=Db::name('harvest')->where($where)->find()){
            $type=strtolower($info['type']);
            $xid=(int)$info['xid'];
            switch ($type){
                case 'video':
                    $xwhere['vid']=$info['xid'];
                    $xwhere['del']=0;
                    $info=Db::name('video')->where($xwhere)->find();
                    if($info){
                        return $info['name'];
                    }else{
                        return "无该信息";
                    }
                break;
                default:

                break;
            }  
        }else{
            return '无该信息';
        } 
    }
    function hid_url($hid){
        $where['del']=0;
        $where['hid']=$hid;
        if($info=Db::name('harvest')->where($where)->find()){
            $type=strtolower($info['type']);
            $xid=(int)$info['xid'];
            switch ($type){
                case 'video':
                    $xwhere['vid']=$info['xid'];
                    $xwhere['del']=0;
                    $info=Db::name('video')->where($xwhere)->find();
                    if($info){
                        return url('portal/video/index',['vid'=>$xid]);
                    }else{
                        return url('portal/error/index');
                    }
                break;
                default:

                break;
            }  
        }else{
            return url('portal/error/index');
        } 
    }
    function hid_ico($hid){
        $where['del']=0;
        $where['hid']=$hid;
        if($info=Db::name('harvest')->where($where)->find()){
            $type=strtolower($info['type']);
            switch ($type){
                case 'video':
                    return 'glyphicon glyphicon-film';
                break;
                default:

                break;
            }  
        }else{
            return 'glyphicon glyphicon-question-sign';
        }
    }