<?php

namespace app\user\model;

use think\Model;

class GoodModel extends Model{
	public function take_it($info){
		if($this->already_it($info)){
			$insert['uid']=$info['uid'];
			$insert['type']=$info['type'];
			$insert['xid']=$info['xid'];
			$insert['gb']=$info['gb'];//为0为bad 1为good
			return $this->insert($insert);
		}else{
			return false;
		}
	}
	public function good_count($info){
		$where['type']=$info['type'];
		$where['xid']=$info['xid'];
		$where['gb']=1;//为0为bad 1为good
		$where['del']=0;
		return $this->where($where)->count();
	}
	public function bad_count($info){
		$where['type']=$info['type'];
		$where['xid']=$info['xid'];
		$where['del']=0;
		$where['gb']=0;//为0为bad 1为good
		return $this->where($where)->count();
	}
	public function how_it($info){
		$re['good']=$this->good_it($info);
		$re['bad']=$this->bad_it($info);
		return $re;
	}
	public function already_it($info){
		$where['uid']=$info['uid'];
		$where['type']=$info['type'];
		$where['del']=0;
		$where['xid']=$info['xid'];
		if($this->where($where)->select()){
			return true;
		}else{
			return false;
		}
	}
	public function del_one($info){
		$where['type']=$info['type'];
		$where['xid']=$info['xid'];
		$where['uid']=$info['uid'];
		$where['del']=0;
		$update['del']=time();
		return $this->where($where)->update($update);
	} 
}