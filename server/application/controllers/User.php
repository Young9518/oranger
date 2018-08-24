<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use QCloud_WeApp_SDK\Mysql\Mysql as DB;

class User extends CI_Controller {
    public function getUsers(){
     $users = DB::select('user', ['*']);
        $this->json([
            'code' => 0,
            'data' => $users
        ]);
    }

    public function addUser(){
      $data = $this->input->get();
      $res = DB::insert('user', $data);
        if($res){
            $this->json([
                'code' => 0,
                'data' => [
                    'msg' => '注册成功'
                ]
            ]);
        }
    }

    public function getUserById(){
      $id = $this->input->get('id');
      $user = DB::row('user', ['*'], ['openId' => $id]);
      if($user){
        $this->json([
            'code' => 0,
            'data' => $user
        ]);
      }
    }
    public function getUserCodByUId(){
      $id = $this->input->get('id');
      $user = DB::row('user', ['*'], ['openId' => $id]);
      //查询记录信息
      $user->driveInfo = DB::select('driveInfo',['*'],['userId'=>$user->id]);
      if($user){
        $this->json([
            'code' => 0,
            'data' => $user
        ]);
      }
    }
}
