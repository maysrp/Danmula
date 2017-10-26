<?php

namespace app\user\model;

use think\Model;

class WatchModel extends Model{
	public function watch_count($info){
		$where['type']=$info['type'];
		$where['xid']=$info['xid'];
		$where['del']=0;
		return $this->where($where)->count();
	}
	public function watch($info){
		$insert['uid']=$info['uid'];
		$insert['type']=$info['type'];
		$insert['xid']=$info['xid'];
		$insert['time']=time();
		return $this->insert($insert);
	}
	public function how_much($info){
		$where['type']=$info['type'];
		$where['xid']=$info['xid'];
		$where['del']=0;
		return $this->where($where)->count();
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