<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use QCloud_WeApp_SDK\Mysql\Mysql as DB;

class Coders extends CI_Controller {


// $this->input->get() ;为获取get数据
/**
    //获取老师接口
    public function getTeachers(){
        $teachers = DB::select('teacher', ['*']);
        $this->json([
            'code' => 0,
            'data' => $teachers
            
        ]);
    }
**/
    //增加课程接口
    public function addCoder() {
        $data = $this->input->get() ;
        $res = DB::insert('driveInfo', $data);
        if($res){
            $this->json([
                'code' => 0,
                'data' => [
                    'msg' => '新增课程成功'
                ]
            ]);
        }
    }

    //修改课程接口
    public function editCourse() {
        $id = $this->input->get('id');
        $data = $this->input->get();
        
        //数据库修改
        $res = DB::update('driveInfo', $data,['id' => $id]);
        if($res){
            $this->json([
                'code' => 0,
                'data' => [
                    'msg' => '修改课程成功'
                ]
            ]);
        }
    }
    //获取课程接口
    public function getCodersById() {
        $id = $this->input->get('id');
        $coder = DB::row('driveInfo', ['*'], ['id' => $id]);
        //$coder->user=DB::row('user', ['*'], ['id' => $coder->userId ]);
        $this->json([
            'code' => 0,
            'data' => $coder
        ]);
    }

    //删除课程接口
    public function deleteCoder(){
        $id = $this->input->get('id');
        $res = DB::delete('driveInfo', ['id' => $id]);
        if($res){
            $this->json([
                'code' => 0,
                'data' =>  [
                    'msg' => '删除课程成功'
                ]
            ]);
        }
    }
    //获取全部课程
    public function getCoders(){
        $coders = DB::select('driveInfo', ['*']);
        //查询用户信息 
        foreach ($coders as $key => $value) {
            $coders[$key]->user=DB::row('user',['*'],['id' => $value->userId ]);
        }
        $this->json([
            'code' => 0,
            'data' => $coders
        ]);
    }

    //获取特定用户记录
    public function getCodersByUid(){
      $id = $this->input->get('id');
      $coders = DB::select('driveInfo', ['*'],['userId' => $id]);
      if($coders){
        $this->json([
              'code' => 0,
              'data' => $coders
          ]);
      }
    }
}