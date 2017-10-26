<?php

namespace app\user\model;

use think\Model;

class CollectionModel extends Model{
	public function add_collection($info){
		if($this->is_collection($info)){
			$insert['name']=$info['name'];
			$insert['xid']=$info['xid'];
			$insert['type']=$info['type'];
			$insert['uid']=$info['uid'];
			$insert['del']=0;
			return $this->insert($insert);
		}else{
			return false;
		}
	}

	public function collection($cid){
		return $this->cid($cid);
	}
	public function cid($cid){
		$where['cid']=$cid;
		$where['del']=0;
		$info=$this->where($where)->find();
		return $info->data;//返回全部信息
	}
	public function is_collection($info){
		$where['name']=$info['name'];
		$where['xid']=$info['xid'];
		$where['type']=$info['type'];
		$where['uid']=$info['uid'];
		$where['del']=0;
		return $this->where($where)->select();
	}
	public function name($name){
		$where['name']=$name;
		$where['del']=0;
		return $this->where($where)->column('cid','name','description','time');
	}
	public function search($name){
		$where['name']=['like'=>'%'.$name.'%'];
		$where['del']=0;
		return $this->where($where)->column('cid','name','description','time');
	}
	public function my_cid($info){
		$where['cid']=$info['cid'];
		$where['del']=0;
		$where['uid']=$info['uid'];
		$info=$this->where($where)->select();
		return $info->data;
	}
	public function make_description($info){
		if($info=$this->my_cid($info)){
			$where['cid']=$info['cid'];
			$where['del']=0;
			$where['uid']=$info['uid'];
			$update['description']=$info['description'];
			$update['time']=$time();
			return $this->where($where)->update();
		}else{
			return false;
		}
	}
}