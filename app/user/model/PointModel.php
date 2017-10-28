<?php

namespace app\user\model;

use think\Model;

class PhotoModel extends Model{
    public function point_now($uid){
        $where['uid']=$uid;
        $where['del']=0;
        $info=$this->where($where)->order('time desc')->find();
        if($info){
            return $indo->data;    
        }else{
            return false;
        }

    }
    public function point_history($uid){
        $where['uid']=$uid;
        $where['del']=0;
        $info=$this->where($where)->select();
        return $info;//foreach 取对象
    }
    public function point_action($info){
        $insert['uid']=$info['uid'];
        $now=$this->point_now($add);
        if($info['am']){
            $insert['point']=$now['point']+$info['point'];
            $insert['am']=1;            
        }else{
            $insert['point']=$now['point']-$info['point'];
            $insert['am']=0;            
        }
        $insert['time']=time();
        return $this->insert($insert);
    }



}