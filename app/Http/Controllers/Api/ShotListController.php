<?php

namespace App\Http\Controllers\Api;

use Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Http\Controllers\RestController;
use App\Libraries\Export\Export;
use App\Models\ShotList;

class ShotListController extends RestController
{

    public function __construct(Request $request)
    {
        parent::__construct('ShotList');
        $this->__request     = $request;
        $this->__apiResource = 'ShotList';
    }

    /**
     * This function is used for validate restfull request
     * @param $action
     * @param string $slug
     * @return array
     */
    public function validation($action,$slug=0)
    {
        $validator = [];
        switch ($action){
            case 'POST':
                $validator = Validator::make($this->__request->all(), [
                    'name'        => 'required|min:2|max:50',
                    'image_url'   => 'required|image|max:10240',
                    'description' => 'required|min:2|max:1000',
                    'is_lock'     => 'in:1,0',
                ]);
                break;
            case 'PUT':
                $validator = Validator::make($this->__request->all(), [
                    'name'        => 'min:2|max:50',
                    'image_url'   => 'image|max:10240',
                    'description' => 'min:2|max:1000',
                    'is_lock'     => 'in:1,0',
                ]);
                break;
            case 'DELETE':
                $validator = Validator::make($this->__request->all(), [
                    'slug' => [
                        Rule::exists('shot_list')->where('slug',$slug)->where('user_id',$this->__request['user']->id)
                    ],
                ]);
                break;
        }
        return $validator;
    }

    /**
     * @param $request
     */
    public function beforeIndexLoadModel($request)
    {

    }

    /**
     * @param $request
     * @param $record
     */
    public function afterIndexLoadModel($request,$record)
    {

    }

    /**
     * @param $request
     */
    public function beforeStoreLoadModel($request)
    {

    }

    /**
     * @param $request
     * @param $record
     */
    public function afterStoreLoadModel($request,$record)
    {

    }

    /**
     * @param $request
     * @param $slug
     */
    public function beforeShowLoadModel($request,$slug)
    {

    }

    /**
     * @param $request
     * @param $record
     */
    public function afterShowLoadModel($request,$record)
    {

    }

    /**
     * @param $request
     * @param $slug
     */
    public function beforeUpdateLoadModel($request,$slug)
    {

    }

    /**
     * @param $request
     * @param $record
     */
    public function afterUpdateLoadModel($request,$record)
    {

    }

    /**
     * @param $request
     * @param $slug
     */
    public function beforeDestroyLoadModel($request,$slug)
    {

    }

    /**
     * @param $request
     * @param $slug
     */
    public function afterDestroyLoadModel($request,$slug)
    {

    }

    public function getPdf()
    {
        $request = $this->__request;

        $param_rule['type'] = 'required|in:PDF';
        $param_rule['shot_list_id'] = 'required|exists:shot_list,id';

        $response = $this->__validateRequestParams($request->all(),$param_rule);

        if( $this->__is_error )
            return $response;

        $data = ShotList::exportShotList($request->all());

        $export['url'] = Export::init($request['type'],'pdf.index',$data)->export();

        $this->__collection  = false;
        $this->__is_paginate = false;

        return $this->__sendResponse($export, 200, __('app.success_listing_msg'));
    }
}
