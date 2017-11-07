<?php

namespace app\user\model;

use think\Model;

class PointModel extends Model{
    public function point_now($uid){
        $where['uid']=$uid;
        $where['del']=0;
        $info=$this->where($where)->order('time desc')->find();
        if($info){
            return $info->data;    
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
        $now=$this->point_now($info['uid']);
        if($now){
            if($info['am']){
                $insert['point']=$now['point']+$info['action'];
                $insert['am']=1;            
            }else{
                $insert['point']=$now['point']-$info['action'];
                $insert['am']=0;            
            }
            $insert['time']=time();
            $insert['action']=$info['action'];
            return $this->insert($insert);
        }else{
            $inser['uid']=$info['uid'];
            $insert['am']=$info['am'];
            if($insert['am']){
                $insert['point']=$info['action'];
            }else{
                $insert['point']=0;
            }
            $insert['action']=$info['action'];
            return $this->insert($insert);
        }
    }
    public function point_del($info){//true為成功 添加一個無action值的表示為取消上次分數
        $insert['uid']=$info['uid'];
        $now=$this->point_now($add);
        $where['pid']=$info['pid'];
        $where['del']=0;
        $delinfo=$this->where($where)->find();
        if($now&&$delinfo->data){
            $update['pid']=$info['pid'];
            $update['del']=0;
            $update['time']=time();
            $rem=$this->update($update);
            if($rem){
                $insert['time']=time();
                $insert['uid']=$info['uid'];
                $delone=$delinfo->data;
                if($delone['am']){
                    $insert['point']=$now['point']+$delone['action'];
                }else{
                    $insert['point']=$now['point']-$delone['action'];
                }
                $insert['del']=$delone['pid'];//保留上次刪除的pid
                return $this->insert($insert);
            }else{
                return false;
            }
        }else{
            return false;
        }
    }



}