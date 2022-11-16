<?php

namespace App\Http\Requests;

use App\Models\Post;
use Illuminate\Auth\Access\Gate;
use Illuminate\Foundation\Http\FormRequest;

class StorePostRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return $this->user()->can('create-post');
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'title' => ['required', 'min:3', 'max:150', 'unique:posts'],
            'description'=> ['required', 'min:3','max:255'],
            'body' => ['required', 'min:10'],
            'photo' => ['required', 'mimes:png,jpeg,webp'],
        ];
    }

    public function messages()
    {
        return [
            'title.required' => 'Không được để trống tiêu đề',
            'title.min' => 'Tiêu đề quá ngắn',
            'title.max' => 'Tên đề quá dài',
            'title.unique' => 'Tiêu đề đã tồn tại',
            'description.required' => 'Không được để trống mô tả',
            'description.min' => 'Mô tả quá ngắn',
            'description.max' => 'Mô tả quá dài',
            'body.required' => 'Không được để trống nội dung bài viết',
            'body.min' => 'Nội dung bài viết quá ngắn'
        ];
    }
}
