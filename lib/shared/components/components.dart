import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nenow/modules/webview.dart';

import '../cubit/news_cubit.dart';

Widget buildArticleItem(article,context)=>Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    InkWell(
      onTap: (){
        navigateto(context, webView(article['url']));
        print(article['url']);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          color: Colors.white38,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  // color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage
                          ('${article['urlToImage']==null?'https://tacm.com/wp-content/uploads/2018/01/no-image-available.jpeg':article['urlToImage']}'),
                        fit: BoxFit.cover
                    )
                ),

              ),
              SizedBox(height: 8,),
              Container(
                child: Text
                  ('${article['title']}',style:Theme.of(context).textTheme.bodyText1 ,
                    overflow:
                TextOverflow
                    .ellipsis,maxLines: 6),
              ),
              SizedBox(height: 8,),
              Text('${article['publishedAt']}',style: TextStyle(color: Colors
                  .grey)),



            ],
          ),

        ),
      ),
    ),


  ],
);

Widget new_builder(List<dynamic> list,context,{isSearch=false}) {
  return list.length > 0
      ? ListView.separated(
      physics: BouncingScrollPhysics(), //بتخليه ميعملشي لون ازرق لما
      // ينزل لاخر الليستة
      itemBuilder: (context, index) => buildArticleItem(list[index],context),
      separatorBuilder: (context, index) => SizedBox(
        height: 20.0,
      ),
      itemCount: 20)
      : Center(
    child:isSearch?Container(): CircularProgressIndicator(),
  );
}

Widget textFormField({
  context,
  required TextEditingController controller,
  required TextInputType type,
  void Function(String)?onsubmitted,
  void Function(String)?onchanged,
  void Function()?sffpressed,
  bool isobsecure=false,
  required  validate,
  required String label,
  required IconData Prefix,
  IconData? suffix,

})=>TextFormField(
  style: TextStyle(color: NewsCubit.get(context).changeiconmode?Colors.black:Colors.white),
  controller: controller,
  onFieldSubmitted: onsubmitted,
  onChanged:onchanged,
  obscureText:isobsecure,
  validator: validate,
  keyboardType:type ,
  decoration: InputDecoration(
    labelText: label,
    labelStyle: TextStyle(color:NewsCubit.get(context).changeiconmode?Colors.black:Colors.white ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: NewsCubit.get(context).changeiconmode?Colors.black:Colors.white),
      borderRadius: BorderRadius.circular(20), // Set the border color here
    ),
    prefixIcon: Icon(
      Prefix,
      color: NewsCubit.get(context).changeiconmode?Colors.black:Colors.white,
    ),
    suffixIcon: suffix!=null?IconButton(
        onPressed:sffpressed ,
        icon: Icon(suffix)
    )
        :null,
  ),



);

void navigateto(BuildContext context,widget) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => widget//arrow method
      ));
}