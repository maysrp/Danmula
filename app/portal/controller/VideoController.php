<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 老猫 <thinkcmf@126.com>
// +----------------------------------------------------------------------
namespace app\portal\controller;

use cmf\controller\HomeBaseController;

use app\user\model\VideoModel;
use app\user\model\GoodModel;
use app\user\model\HarvestModel;
use app\user\model\WatchModel;
use app\user\model\PhotoModel;


class VideoController extends HomeBaseController
{
    public function index()
    {
        $vid = $this->request->param('vid', 1, 'intval');
        
        $Video=new VideoModel();
        $Harvest=new HarvestModel();
        $Good=new GoodModel();
        $Watch=new WatchModel();
        $Photo=new PhotoModel();

        $info=$Video->vid($vid);
        if($info){
        	$rem['xid']=$vid;
        	$rem['type']='video';
        	
        	$info['good']=$Good->good_count($rem);
        	$info['bad']=$Good->bad_count($rem);
        	$info['harvest']=$Harvest->harvest_count($rem);
        	$info['watch']=$Watch->watch_count($rem);
        	$info['photo']=$Photo->photo_get($rem);
            
            $info['video']=cmf_get_file_download_url($info['video'],3000);
            $info['video']=str_replace('\\','\/',$info['video']);
    

        	$this->assign('info',$info);
        	return $this->fetch('play');
        }else{
        	return $this->fetch('error');
        }

    }

}
