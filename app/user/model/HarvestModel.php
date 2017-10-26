<?php

namespace app\user\model;

use think\Model;

class HarvestModel extends Model{
	public function harvest_count($info){
		$where['type']=$info['type'];
		$where['xid']=$info['xid'];
		$where['del']=0;
		return $this->where($where)->count();
	}
	public function harvest($info){
		$insert['uid']=$info['uid'];
		$insert['name']=$info['name'];
		$insert['type']=$info['type'];
		$insert['xid']=$info['xid'];
		$insert['time']=time();
		return $this->insert($insert);
	}
	public function name($info){//该收藏标签下的作品
		$where['del']=0;
		$where['uid']=$info['uid'];
		$where['name']=$info['name'];
		return $this->where($where)->column('name','type','xid','time');
	}
	public function uid($uid){//用户的收藏
		$where['del']=0;
		$where['uid']=$uid;
		$info=$this->where($where)->column('name');
		return array_unique($info);
	}
	public function del_one($info){//删除 其中一个
		$where['uid']=$info['uid'];
		$where['type']=$info['type'];
		$where['xid']=$info['xid'];
		$where['del']=0;
		$update['del']=time();
		return $this->where($where)->update($update);
	}
	public function del_name($info){//删除整个收藏标签
		$where['uid']=$info['uid'];
		$where['name']=$info['name'];
		$where['del']=0;
		$update['del']=time();
		return $this->where($where)->update($update);
	}

}