<?php

namespace App\Http\Controllers;

use App\Models\Role;
use App\Models\User;
use Auth;
use DB;
use Illuminate\Http\Request;
use RealRashid\SweetAlert\Facades\Alert;

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
        if(Auth::user()->can('delete', $victim->roles->first())) {
            $flag = $victim->delete();
            if ($flag) {
                alert()->success('User Deleted', 'Successfully');
            } else {
                alert()->error("User didn't delete", 'Something went wrong!');
            }
        }
        else alert()->error("Không thể xóa", 'Bạn không có quyền này!');
        return redirect('/admin/role');
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
            $flag = $victim->save();
            if($flag){
                alert()->success('User edited', 'Successfully');
            } else alert()->error("User wasn't edited", 'Something went wrong!');
            return redirect('/admin/role');
        }
    }
}
