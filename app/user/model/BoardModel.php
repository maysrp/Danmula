<?php

namespace app\user\model;

use think\Model;

class BoardModel extends Model{
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
   public function exlist(){
        $where['del']=0;
        $info=$this->where($where)->select();
        return $info->toArray();
    }

}