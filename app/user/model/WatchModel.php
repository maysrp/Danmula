<?php

namespace app\user\model;

use think\Model;
use think\Db;

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
		switch ($info['type']){
			case 'video':
				$where['vid']=$info['xid'];
				$where['del']=0;
				Db::name('video')->where($where)->setInc('watch');
				break;
			default:
				break;
		}
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