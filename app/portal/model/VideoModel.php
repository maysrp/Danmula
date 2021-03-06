<?php

namespace app\portal\model;

use think\Model;

class VideoModel extends Model{
	public function player($player){
		return $this->vid($player);

	}
	public function vid($vid){
		$where['vid']=$vid;
		$where['del']=0;
		$info=$this->where($where)->find();
		if($info){
			return $info->data;//可能是 $info['data'];
		}else{
			return false;
		}
	} 
	public function my_vid($vid,$uid){
		$info=$this->vid($vid);
		if($info){
			if($info['uid']==$uid){
				return $info;
			}else{
				return false;
			}
		}else{
			return false;
		}
	}
	public function edit($vid,$uid,$info){
		if($oinfo=$this->my_vid($vid,$uid)){
			#update info
			$update['vid']=$oinfo['vid'];
			$update['name']=$info['name'];
			$update['utime']=time();
			$update['checked']=0;
			$update['description']=$info['description'];
			return $this->update($update);
		}else{
			return false;
		}
	}
	public function video($vid){
		if($info=$this->vid($vid)){
			return $info['video'];
		}else{
			return false;
		}
	}
	public function upload($info){
		$insert['video']=$info['video'];
		$insert['name']=$info['name'];
		$insert['description']=$info['description'];
		$insert['ctime']=time();
		$insert['checked']=0;
		return $this->insert($insert);
	}

}