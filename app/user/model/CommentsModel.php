<?php

namespace app\user\model;

use think\Model;

class CommentsModel extends Model{
	public function coid($id){
		$where['coid']=$id;
		$where['del']=0;
		$info=$this->where($where)->find();
		return $info->data;
	}
	public function comments_del($id){
		$where['coid']=$id;
		$update['coid']=$id;
		$update['del']=time();
		return $this->where($where)->update($update);
	}
	public function uid_all($uid){
		$where['del']=0;
		$where['uid']=$uid;
		return $this->where($where)->select();//对象 :foreach >>> $object->data
	}
	public function xinfo($info){
		#寻找一个对应的XID下的全部评论
		$where['xid']=$info['xid'];
		$where['del']=0;
		$where['type']=$info['type'];
		return $this->where($where)->select();//对象 :foreach >>> $object->data		
	}
	public function comments_add($info){
		$insert['uid']=$info['uid'];
		if($info['rid']){
			$insert['rid']=$info['rid'];
		}
		$insert['xid']=$info['xid'];
		$insert['type']=$info['type'];
		$insert['time']=time();
		$insert['comments']=$info['comments'];
		if($insert['xid'] && $insert['type'] && $insert['uid'] && $insert['comments']){
			return $this->insert($insert);
		}else{
			return false;
		}
		
	}


}