<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class CmsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $role_id = $this->addCmsRoles();
        $this->addCmsUser($role_id);
        $this->addCmsModules();
        $this->mailTemplates();
        $this->user_group();
        $this->addApplicationSettings();
        $this->cms_widget();
    }

    public function addCmsRoles()
    {
        $role_id = \DB::table('cms_roles')->insertGetId([
            'name'           => 'Super Admin',
            'slug'           => Str::slug('Super Admin'),
            'is_super_admin' => '1',
            'created_at'     => Carbon::now()
        ]);
        return $role_id;
    }

    public function addCmsUser($role_id)
    {
        \DB::table('cms_users')->insert([
            'cms_role_id' => $role_id,
            'name'        => 'RetroCube',
            'username'    => 'retrocube',
            'slug'        => 'retrocube',
            'email'       => 'admin@retrocube.com',
            'mobile_no'   => '1-8882051816',
            'password'    => Hash::make('admin@123$'),
            'created_at'  => Carbon::now(),
        ]);
    }

    public function addCmsModules()
    {
        $data = [
            [
                'parent_id'    => 0,
                'name'         => 'Cms Roles Management',
                'route_name'   => 'cms-roles-management.index',
                'icon'         => 'fa fa-key',
                'status'       => '1',
                'sort_order'   => 1,
                'created_at'   => Carbon::now()
            ],
            [
                'parent_id'    => 0,
                'name'         => 'Cms Users Management',
                'route_name'   => 'cms-users-management.index',
                'icon'         => 'fa fa-users',
                'status'       => '1',
                'sort_order'   => 2,
                'created_at'   => Carbon::now()
            ],
            [
                'parent_id'    => 0,
                'name'         => 'Application Setting',
                'route_name'   => 'admin.application-setting',
                'icon'         => 'fa fa-cog',
                'status'       => '1',
                'sort_order'   => 3,
                'created_at'   => Carbon::now()
            ],
            [
                'parent_id'    => 0,
                'name'         => 'Users Management',
                'route_name'   => 'app-users.index',
                'icon'         => 'fa fa-users',
                'status'       => '1',
                'sort_order'   => 4,
                'created_at'   => Carbon::now()
            ],[
                'parent_id'    => 0,
                'name'         => 'Content Management',
                'route_name'   => 'content-management.index',
                'icon'         => 'fa fa-tasks',
                'status'       => '1',
                'sort_order'   => 5.0,
                'created_at'   => Carbon::now()
            ],[
                'parent_id'    => 0,
                'name'         => 'FAQ`s',
                'route_name'   => 'faq.index',
                'icon'         => 'fa fa-question-circle-o',
                'status'       => '1',
                'sort_order'   => 6.0,
                'created_at'   => Carbon::now()
            ]
        ];
        \DB::table('cms_modules')->insert($data);
    }


    public function addApplicationSettings()
    {
        $data = [
            [
                'identifier' => 'application_setting',
                'meta_key' => "favicon",
                'value' => "images/favicon.png",
                'is_file' => 1,
                'created_at' => Carbon::now()
            ],
            [
                'identifier' => 'application_setting',
                'meta_key' => "logo",
                'value' => "images/favicon.png",
                'is_file' => 1,
                'created_at' => Carbon::now()
            ],
            [
                'identifier' => 'application_setting',
                'meta_key' => "application_name",
                'value' => config("app.name"),
                'is_file' => 0,
                'created_at' => Carbon::now()
            ]
        ];
        \DB::table('application_setting')->insert($data);
    }


    public function mailTemplates()
    {
        $forgot_password_template = file_get_contents(__DIR__ . '/forgot_password_template_body.blade.php',FILE_USE_INCLUDE_PATH);
        $user_register_template =  file_get_contents(__DIR__ . '/user_register_template_body.blade.php',FILE_USE_INCLUDE_PATH);
        $data =
            [
                [
                    'identifier' => 'forgot-password',
                    'subject'    => 'Forgot Password Confirmation',
                    'body'       => $forgot_password_template,
                    'wildcard'   => '[USERNAME],[LINK],[YEAR],[APP_NAME]',
                    'created_at' => Carbon::now()
                ],
                [
                    'identifier' => 'user_registration',
                    'subject'    => 'Welcome to [APP_NAME]',
                    'body'       => $user_register_template,
                    'wildcard'   => '[USERNAME],[LINK],[YEAR],[APP_NAME]',
                    'created_at' => Carbon::now()
                ]
            ];
        \DB::table('mail_templates')->insert($data);
    }

    public function user_group()
    {
        \DB::table('user_groups')
            ->insert([
                'title' => 'App User',
                'slug'  => 'app-user',
                'status'=> '1',
                'created_at' => Carbon::now()
            ]);
    }

    public function cms_widget()
    {
        \DB::table('cms_widgets')
            ->insert([
                [
                    'title'       => 'Total User',
                    'description' => NULL,
                    'icon'        => 'icon-user',
                    'color'            => '#4b71fa',
                    'div_column_class' => 'col-md-3',
                    'link'             => '/admin/app-users',
                    'widget_type'      => 'small_box',
                    'sql'              => 'Select count(*) from users limit 1',
                    'config'           => NULL,
                ],
                [
                    'title'       => 'Total Roles',
                    'description' => NULL,
                    'icon'        => 'icon-people',
                    'color'            => '#7bcb4d',
                    'div_column_class' => 'col-md-3',
                    'link'             => '/admin/app-users',
                    'widget_type'      => 'small_box',
                    'sql'              => 'Select count(*) from users limit 1',
                    'config'           => NULL,
                ],
                [
                    'title'       => 'Total User',
                    'description' => NULL,
                    'icon'        => 'icon-user',
                    'color'            => '#4b71fa',
                    'div_column_class' => 'col-md-3',
                    'link'             => '/admin/app-users',
                    'widget_type'      => 'small_box',
                    'sql'              => 'Select count(*) from users limit 1',
                    'config'           => NULL,
                ],
                [
                    'title'       => 'Total Roles',
                    'description' => NULL,
                    'icon'        => 'icon-people',
                    'color'            => '#7bcb4d ',
                    'div_column_class' => 'col-md-3',
                    'link'             => '/admin/app-users',
                    'widget_type'      => 'small_box',
                    'sql'              => 'Select count(*) from users limit 1',
                    'config'           => NULL,
                ],
                [
                    'title'       => 'Users',
                    'description' => NULL,
                    'icon'        => 'icon-user',
                    'color'            => '#fff',
                    'div_column_class' => 'col-md-12',
                    'link'             => '/admin/app-users',
                    'widget_type'      => 'line_chart',
                    'sql'              => 'SELECT count(id) AS value, MONTHNAME(created_at) as label FROM users where YEAR(created_at) = YEAR(now()) group by MONTH(created_at) order by MONTH(created_at) asc',
                    'config'           => NULL,
                ]
            ]);

    }
}
