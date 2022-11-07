<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CategoryController extends Controller
{
    public function __construct(){
        $this->middleware('admin');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $cates = Category::all();
        return view('admin.category', ['cates'=> $cates]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $this->validator($request);
            $cate = new Category;
            $cate->name = $request->name;
            $flag = $cate->save();
            if ($flag) {
                alert()->success('Category added', 'Successfully');
            } else alert()->error("Category wasn't added", 'Something went wrong!');
        return redirect('admin/category');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $cate = Category::find($id);
        $flag = $cate->delete();
        if($flag){
            alert()->success('Category deleted', 'Successfully');
        }
        else alert()->error("Category wasn't added", 'Something went wrong!');
        return redirect('/admin/category');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $this->validator($request);
        $cate = Category::findOrFail($request->id);
        $cate->name = $request->name;
        return($cate->save());
    }

    protected function validator(Request $request){
        return $request->validate([
            'name' => ['required', 'string', 'min:3', 'max:20', 'unique:categories'],
        ],[
            'name.required' => 'Không được để trống',
            'name.min' => 'Tên quá ngắn',
            'name.max' => 'Tên quá dài',
            'name.unique' => 'Category duplicated'
        ]);
    }
}
