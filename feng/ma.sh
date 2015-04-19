#!/bin/bash
CC='g++ -g -Wall'
cd errhandle
	#rm *.obj *.a
	cpp_file_list=`ls *.cpp`
	lib_name="liberrhandle.a"
	dep_lib="."
	dep_lib_path="."
	for file in $cpp_file_list
	do
		#echo $file
		file_no_suffix=`echo $file | awk '{split($1,arr,".");print arr[1]}'| tr -d "\r\n"`
		echo "$CC -c $file -o $file_no_suffix'.obj' -l $dep_lib -L $dep_lib_path"
		$CC -c $file -o $file_no_suffix".obj" -l $dep_lib -L $dep_lib_path
	done
	ar rvf $lib_name  *.obj

cd -	
cd wrappedfunc
	#rm *.obj *.a
	cpp_file_list=`ls *.cpp`
	lib_name="libwrappedfunc.a"
	dep_lib="errhandle"
	dep_lib_path="../errhandle"
	for file in $cpp_file_list
	do
		#echo $file
		file_no_suffix=`echo $file | awk '{split($1,arr,".");print arr[1]}'| tr -d "\r\n"`
		echo "$CC -c $file -o $file_no_suffix'.obj' -l $dep_lib -L $dep_lib_path"
		$CC -c $file -o $file_no_suffix".obj" -l $dep_lib -L $dep_lib_path
	done
	ar rvf $lib_name  *.obj
cd -	
cd clistr
	#rm *.obj *.a
	cpp_file_list=`ls *.cpp`
	lib_name="libclistr.a"
	dep_lib="-l errhandle -l wrappedfunc"
	dep_lib_path="-L ../errhandle -L ../wrappedfunc"
	for file in $cpp_file_list
	do
		#echo $file
		file_no_suffix=`echo $file | awk '{split($1,arr,".");print arr[1]}'| tr -d "\r\n"`
		echo "$CC -c $file -o $file_no_suffix'.obj'  $dep_lib  $dep_lib_path"
		$CC -c $file -o $file_no_suffix".obj"  $dep_lib  $dep_lib_path
	done
	ar rvf $lib_name  *.obj
cd -
cd tcpclisrvselect00
	cpp_file_list=`ls *.cpp`
	lib_name=''
	dep_lib="-l clistr -l errhandle -l wrappedfunc "
	dep_lib_path="-L ../errhandle -L ../wrappedfunc -L ../clistr"
	for file in $cpp_file_list
	do
		file_no_suffix=`echo $file | awk '{split($1,arr,".");print arr[1]}'| tr -d "\r\n"`
		echo "$CC $file -o $file_no_suffix $dep_lib  $dep_lib_path"
		$CC $file -o $file_no_suffix $dep_lib  $dep_lib_path
	done
cd -
