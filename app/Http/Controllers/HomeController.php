<?php
namespace App\Http\Controllers;

use App\Models\ContentManagement;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function getContent($slug)
    {
        $data['content'] = ContentManagement::getBySlug($slug);
        if( !isset($data['content']->id) )
            return redirect('/');

        return view('content', $data);
    }

    public function truncateData(Request $request)
    {
        if( \App::environment(['local', 'staging']) ) {
            if($request['password'] != 'admin@123')
                return $this->__sendError('validation Message',['message' => 'invalid credential'],400);

            \DB::statement('SET FOREIGN_KEY_CHECKS=0;');
            \DB::table('breaks')->truncate();
            \DB::table('media')->truncate();
            \DB::table('notification')->truncate();
            \DB::table('reset_password')->truncate();
            \DB::table('scenes')->truncate();
            \DB::table('shot_list')->truncate();
            \DB::table('user_api_token')->truncate();
            \DB::table('user_share')->truncate();
            \DB::table('user_member')->truncate();
            \DB::table('users')->truncate();
            \DB::statement('SET FOREIGN_KEY_CHECKS=1;');

            $this->__is_paginate = false;
            $this->__collection  = false;

            return $this->__sendResponse([],200, 'Data has been deleted successfully');
        } else {
            return abort(404);
        }
    }
}
