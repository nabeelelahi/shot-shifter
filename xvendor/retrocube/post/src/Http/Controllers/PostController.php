<?php

namespace Retrocube\Post\Http\Controllers;

use Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Http\Controllers\RestController;

class PostController extends RestController
{
    public function __construct(Request $request)
    {
        parent::__construct('Post');
        $this->__request      = $request;
        $this->__apiResource  = 'Post';
        $this->__apiResourcePath  = '\Retrocube\Post\Http\Resources\\';
        $this->__model_path       = '\Retrocube\Post\Models\\';
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
                    'title'       => 'string|max:150',
                    'description' => 'string|max:5000',
                    'media.*'     => 'required|max:20480|mimetypes:' . config('Post.MEDIA_MIME_TYPE'),
                    'font_style'  => 'string|max:150',
                    'font_color'  => 'string|max:150',
                    'post_type'   => 'required|in:post,feeling_activity',
                    'feeling_activity_id' => 'integer',
                    'privacy_type' => 'required|in:everyone,friends,friends_except,only_me',
                ]);
                break;
            case 'PUT':
                $this->__request->merge(['slug' => $slug]);
                $validator = Validator::make($this->__request->all(), [
                    'title'       => 'string|max:150',
                    'description' => 'string|max:5000',
                    'media.*'     => 'max:20480|mimetypes:' . config('Post.MEDIA_MIME_TYPE'),
                    'font_style'  => 'string|max:150',
                    'font_color'  => 'string|max:150',
                    'post_type'   => 'required|in:post,feeling_activity',
                    'feeling_activity_id' => 'integer',
                    'privacy_type' => 'required|in:everyone,friends,friends_except,only_me',
                    'slug'   => 'required|exists:posts,slug,' . $this->__request['user']->id
                ]);
                break;
            case 'DELETE':
                $user = $this->__request['user'];
                $this->__request->merge(['slug' => $slug]);
                $validator = Validator::make($this->__request->all(), [
                    'slug'   => 'required|exists:posts,slug,' . $this->__request['user']->id
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
        echo '<pre>'; print_r($request->all()); exit;
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
    public function beforeUpdateLoadModel($request, $slug)
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
}
