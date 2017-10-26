<?php

namespace app\user\model;

use think\Model;

class BlackModel extends Model{
    public function put_one($info){
        $insert['uid']=$info['uid'];
        $insert['xid']=$info['xid'];
		$insert['type']=$info['type'];
        $insert['time']=time();
        $insert['info']=$info['info'];
        return $this->insert($insert);
    }
    public function uid($uid){
        $where['uid']=$uid;
        $where['del']=0;
        return $this->where($where)->select();//对象 :foreach >>> $object->data        
    }
    public function bid($bid){
        $where['bid']=$bid;
        $where['del']=0;
        $info=$this->where($where)->find();
		return $info->data;
    }
    public function checked($info){
        $where['bid']=$info['bid'];
        $where['del']=0;
        $update['checked']=$info['checked'];//目前规划 0 未 1 看过（待定） 2 不通过 3 通过
        return $this->where($where)->update($update);
    }
    public function unchecked($info){
        $where['del']=0;
        $where['checked']=$info['checked'];
        if($info['uid']){
            $where['uid']=$info['uid'];
        }
        if($info['time']){
            $rem=info['gt']?'gt':'elt';
            $where['time']=array($rem,$info['time']);
        }
        return $this->where($where)->select();//对象 :foreach >>> $object->data        
    }

}