<?php
    use think\Db;
    function test(){
        echo 'hi';
    }
    function vid_name($vid){
        $where['vid']=$vid;
        $where['del']=0;
        $info=Db::name('video')->where($where)->find();
        return $info['name'];
    }