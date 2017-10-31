<?php

namespace app\user\model;

use think\Model;

class PhotoModel extends Model{
	public function photo_add($info){
		$insert['xid']=$info['xid'];
		$insert['type']=$info['type'];
		$insert['time']=time();
		$insert['url']=$info['url'];
		return $this->insert($insert);
	}
	public function photo_change($info){
		$where['xid']=$info['xid'];
		$where['type']=$info['type'];
		//$where['poid']=$info['poid'];
		$where['del']=0;
		$update['url']=$info['url'];
		return $this->where($where)->update($update);
	}	
	public function photo_del($info){
		$where['xid']=$info['xid'];
		$where['type']=$info['type'];
		//$where['poid']=$info['poid'];
		$where['del']=0;
		$update['del']=time();
		return $this->where($where)->update($update);
	}
	public function photo_get($info){
		$where['xid']=$info['xid'];
		$where['type']=$info['type'];
		//$where['poid']=$info['poid'];
		$where['del']=0;
		$info=$this->where($where)->find();
		if($info){
			$url=cmf_get_file_download_url($info['url'],3000);
			return str_replace("\\","\/",$url);
		}else{
			return false;
		}
	}
}