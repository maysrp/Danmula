<?php
    use think\Db;
    use app\user\model\PhotoModel;
    use app\user\model\PointModel;

    function test(){
        echo 'hi';
    }
    function vid_name($vid){
        $where['vid']=$vid;
        $where['del']=0;
        $info=Db::name('video')->where($where)->find();
        if($info){
            return $info['name'];
        }else{
            return "不存在该内容";
        }
    }
    function is_harvest($xid,$type){
        $user = cmf_get_current_user();
        $where['xid']=$xid;
        $where['type']=$type;
        $where['del']=0;
        $where['uid']=$user['id'];
        if(Db::name('harvest')->where($where)->find()){
            return 'text-danger';
        }else{
            return 'text-success';
        }
    }
    function hid_name($hid){
        $where['del']=0;
        $where['hid']=$hid;
        if($info=Db::name('harvest')->where($where)->find()){
            $type=strtolower($info['type']);
            $xid=(int)$info['xid'];
            switch ($type){
                case 'video':
                    $xwhere['vid']=$info['xid'];
                    $xwhere['del']=0;
                    $info=Db::name('video')->where($xwhere)->find();
                    if($info){
                        return $info['name'];
                    }else{
                        return "无该信息";
                    }
                break;
                default:

                break;
            }  
        }else{
            return '无该信息';
        } 
    }
    function vid_url($vid){
        $vid=(int)$vid;
        $info=Db::name('video')->find($vid);
        if($info){
            if($info['checked']>1 && !$info['del']){
                return url('portal/video/index',['vid'=>$vid]);
            }else{
                return '';
            }
        }else{
            return '';
        }

    }
    function hid_url($hid){
        $where['del']=0;
        $where['hid']=$hid;
        if($info=Db::name('harvest')->where($where)->find()){
            $type=strtolower($info['type']);
            $xid=(int)$info['xid'];
            switch ($type){
                case 'video':
                    $xwhere['vid']=$info['xid'];
                    $xwhere['del']=0;
                    $info=Db::name('video')->where($xwhere)->find();
                    if($info){
                        return url('portal/video/index',['vid'=>$xid]);
                    }else{
                        return url('portal/error/index');
                    }
                break;
                default:

                break;
            }  
        }else{
            return url('portal/error/index');
        } 
    }
    function hid_ico($hid){
        $where['del']=0;
        $where['hid']=$hid;
        if($info=Db::name('harvest')->where($where)->find()){
            $type=strtolower($info['type']);
            switch ($type){
                case 'video':
                    return 'glyphicon glyphicon-film';
                break;
                default:

                break;
            }  
        }else{
            return 'glyphicon glyphicon-question-sign';
        }
    }
    // function is_valid($xid,$type){//查看文件是否存在\ 目前只能视频
    //     switch ($typs){
    //         case 'video':
    //             $where['del']=0;
    //             $where['vid']=$vid;
    //             return Db::name('video')->where($where)->find();//true 为有 否则无
    //             break;
    //         default:

    //         break;
    //     }
       
    // }

    function is_valid($vid){
        $where['del']=0;
        $where['vid']=$vid;
        return Db::name('video')->where($where)->find();//true 为有 否则无
    }
    function select_board_option(){
        $where['del']=0;
        $info=Db::name('board')->where($where)->select();
        $xinfo=$info->toArray();
        foreach($xinfo as $value){
            echo "<option value='".$value['id']."'>".$value['name']."</option>";
        }
        
    }
    function select_board_option_old($id){
        $where['del']=0;
        $info=Db::name('board')->where($where)->select();
        $xinfo=$info->toArray();
        $video=Db::name('video')->find($id);
        foreach($xinfo as $value){
            if($value['id']==$video['board']){
                echo "<option selected value='".$value['id']."'>".$value['name']."</option>";
                
            }else{
                echo "<option value='".$value['id']."'>".$value['name']."</option>";
                
            }
        }
    }
    function board($id){
        $id=(int)$id;
        $info=Db::name('board')->find($id);
        if($info){
            return $info['name'];
        }else{
            $info=Db::name('board')->find(1);
            return $info['name'];
        }
    }
    function photo_vid($vid){
        $vid=(int)$vid;
        $Photo=new PhotoModel();
        $where['type']='video';
        $where['xid']=$vid;
        return $Photo->photo_get($where);
        
        // $where['del']=0;
        // $info=Db::name('photo')->where($where)->find();
        // if($info){
        //     $url=cmf_get_file_download_url($info['url'],3000);
		// 	return str_replace("\\","\/",$url);
        // }else{
        //     return "";//默认url
        // }

    }
    function watch_vid($vid){
        $vid=(int)$vid;
        $where['type']='video';
        $where['xid']=$vid;
        $where['del']=0;
        $info=Db::name('watch')->where($where)->count();
        if($info){
            return $info;
        }else{
            return 0;
        }
    }
    function danmu_vid($vid){
        $vid=(int)$vid;
        $where['del']=0;
        $where['player']=$vid;
        return Db::name('danmu')->where($where)->count();
    }
    function harvest_vid($vid){
        $vid=(int)$vid;
        $where['type']='video';
        $where['xid']=$vid;
        $where['del']=0;
        return Db::name('harvest')->where($where)->count();
    }
    function search_nav($ar){
        $ar=is_array($ar)?$ar:[1];
        $where['del']=0;
        if(!cmf_get_current_user()){
            $where['is_login']=0;
        }
        $info=Db::name('board')->where($where)->select();
        $xinfo=$info->toArray();//全部大板块

        foreach($xinfo as $value){
            if(in_array($value['id'],$ar)){
                 echo "<label class='checkbox-inline'><input type='checkbox' name='board[]' checked value='".$value['id']."' >".$value['name']."</label>";
                
            }else{
                echo "<label class='checkbox-inline'><input type='checkbox' name='board[]' value='".$value['id']."'>".$value['name']."</label>";
                
            }
        }
    }
    function webinfo(){
        $where['del']=0;
        $where['checked']=['>',1];
        $list=Db::name('video')->where($where)->order('ctime desc')->limit(10)->select();
        return $list->toArray();
    }
    function webhot($time=604800){
        $where['del']=0;
        $where['checked']=['>',1];
        $where['ctime']=['>',time()-604800];
        $list=Db::name('video')->where($where)->order('watch desc')->limit(10)->select();
        return $list->toArray();
    }
    function point_upload_video($uid){
        $Point=new PointModel();
        $info['uid']=$uid;
        $info['am']=1;
        $info['action']=5;//添加的分数 上传
        return $Point->point_action($info);
    }
    function point_delete_video($uid){
        $Point=new PointModel();
        $info['uid']=$uid;
        $info['am']=0;
        $info['action']=5;//删除 减分数
        return $Point->point_action($info);
    }
    function point_my($uid){
        $Point=new PointModel();
        $num=$Point->point_now($uid);
        return $num?$num['point']:0;   
    }
    function point_checked($uid){
        $Point=new PointModel();
        $info['uid']=$uid;
        $info['am']=1;
        $info['action']=10;//添加的分数 审核成功
        return $Point->point_action($info);
    }
    function board_url($bid){
        $bid=$bid?(int)$bid:1;//默认板块
        return url('portal/index/board',['board'=>$bid]);
    }