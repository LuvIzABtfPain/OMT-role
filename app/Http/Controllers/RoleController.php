<?php

namespace App\Http\Controllers;

use App\Models\Role;
use App\Models\User;
use Auth;
use DB;
use Illuminate\Http\Request;

class RoleController extends Controller
{
    public function __construct()
    {
        $this->middleware('admin');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = User::with('roles')->get();
        return view('admin.role', ['users'=>$users]);
    }
    public function delete_user($id){
        $victim = User::findOrFail($id);
        if(Auth::user()->can('delete', $victim->roles->first())){
            $victim->delete();
            return redirect('/admin/role');
        }
    }
    public function edit_user(Request $request, $id){
        $victim = User::findOrFail($id);
        $roles = Role::all()->where('id','>', Auth::user()->roles->first()->id);
        if($request->method() == 'GET'){
            return view('admin.user', ['user'=>$victim, 'roles'=>$roles]);
        }
        if($request->method() == 'POST'){
            $victim->name = $request->name;
            $victim->email = $request->email;
            DB::table('user_role')->where('user_id', $id)->update(['role_id' => $request->role]);
            $victim->save();
            return redirect('/admin/role');
        }
    }
}
