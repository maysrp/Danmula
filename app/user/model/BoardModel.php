<?php

namespace app\user\model;

use think\Model;

class BloadModel extends Model{
   public function achieve(){
       $where['del']=0;
       $list=[];
       $info=$this->where($where)->select();
       foreach($info as $value){
        //    $one['id']=$value['id'];
        //    $one['name']=$value['name'];
        //    $list[]=$one;
            $list[]=$value['name'];
       }
       return $list;
   }
   public function list(){
        $where['del']=0;
        $info=$this->where($where)->select();
        return $info->toArray();
    }

}