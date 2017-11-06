<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 小夏 < 449134904@qq.com>
// +----------------------------------------------------------------------
namespace app\admin\controller;

use think\Db;
use cmf\controller\AdminBaseController;


class BoardController extends AdminBaseController
{
    public function index(){
        $where['del']=0;
        $info=Db::name('board')->where($where)->select();
        $this->assign('list',$info);
        return $this->fetch();
    }
    public function board_public(){
        $id=$this->request->param('id',0,'intval');
        $public=$this->request->param('public',0,'intval');
        if($public){
            $update['is_login']=1;
        }else{
            $update['is_login']=0;
        }
        $where['id']=$id;
        $re['status']=Db::name('board')->where($where)->update($update);
        return json($re);
        
    }
    public function board_edit(){
        $name=$this->request->param('name');
        $description=$this->request->param('description');
        $is_login=$this->request->param('is_login',0,'intval');
        $id=$this->request->param('id',0,'intval');
        $where['del']=0;
        $where['id']=$id;
        if(!$name){
            $info=Db::name('board')->where($where)->find();
            if($info){
                $this->assign('info',$info);
                return $this->fetch();
            }else{
                $this->error("不存在该板块");
            }
        }else{
            $update['is_login']=$is_login;
            $update['name']=$name;
            $update['description']=$description;
            $update['utime']=time();
            $rex=Db::name('board')->where($where)->update($update);
            if($rex){
                $this->success('修改成功',url('admin/board/index'));
            }else{
                $this->error('修改失败');
            }
        }
        
    }
    public function board_delete(){
        $id=$this->request->param('id',0,'intval');
        $where['id']=$id;
        $update['del']=time();
        $re['status']=Db::name('board')->where($where)->update($update);
        return json($re);

    }
    public function board_add(){
        $name=$this->request->param('name');
        $description=$this->request->param('description');
        $is_login=$this->request->param('is_login',0,'intval');
        if($name){
            $insert['name']=$name;
            $insert['description']=$description;
            $insert['is_login']=$is_login>=1?1:0;
            $rex=Db::name('board')->insert($insert);
            if($rex){
                $this->success("板块添加成功",url('board/index'));
            }else{
                $this->error('板块添加失败');
            }
        }else{
            return $this->fetch();
        }
    }
}