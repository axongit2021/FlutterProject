import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'MyTip',
  
  home:MyTip(),
));
class MyTip extends StatefulWidget {
  @override
  _MyTipState createState() => _MyTipState();
}

class _MyTipState extends State<MyTip> {
  int _tipPercentage=0;
  int _split=1;
  int _sval=0;
  double _billAmount =0.0;
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(

          body:
            Column(
            children: [
              
              Container(
                padding:const EdgeInsets.all(20.0),
                
                child: 
                
                  Container(
                    
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                       color:Colors.pink.withOpacity(0.15),
                       
                       borderRadius: BorderRadius.circular(10),
                      
                    ),
                    
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                           children:[
                             
                             Text('Per Person Tip Is:',style: TextStyle(color: Colors.pink[300],fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,fontSize: 14),),
                             Text('\$${calculateTotalbill( _billAmount, _split,_tipPercentage)}',style: TextStyle(fontSize:26,fontStyle: FontStyle.italic,color: Colors.pink[500]),)
                           ]
                      ),
                    ),
                    margin: const EdgeInsets.only(top:20.0),
                    height: MediaQuery.of(context).size.height*0.2,
                   
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height*0.5,
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.only(left:20,right: 20,),
                    decoration: BoxDecoration(
                      color:Colors.grey[100],
                      borderRadius:BorderRadius.circular(12),
                      border:Border.all(color:Colors.grey[400])
                    
                    
                    ),
                    child: Column(
                      children:[
                      
                        
                        TextField(
                          textAlign: TextAlign.start,
                          keyboardType:const TextInputType.numberWithOptions(),
                          onChanged: (String value){
                                try{
                                  _billAmount = double.parse(value);
                                }catch(exception ){
                                  _billAmount=0.0;

                                }
                          },
                          autocorrect: true,
                          style: TextStyle(color:Colors.pink[700],fontSize:20),
                          decoration: InputDecoration(
                            border:InputBorder.none,
                            //contentPadding: EdgeInsets.only(left:10),
                            //hintText: 'Enter The Amount',
                            prefixText: 'Amount:  ',
                            prefixStyle:TextStyle(color: Colors.pinkAccent[300],fontWeight:FontWeight.normal,fontSize:17)
                          ),
                        ),
                        Divider(
                          height:4,
                          color: Colors.black26,
                          
                        ),
                        Row(
                          mainAxisAlignment:MainAxisAlignment.spaceBetween,

                          children:[
                            Text('Split:', 
                            style: TextStyle(fontSize:17),),
                            Padding(
                              padding: const EdgeInsets.only(left:138.0),
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    if(_split>1){
                                    _split--;
                                  }
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height:30,
                                  width:30,
                                  child: Text('-',style: TextStyle(
                                    fontSize:24,
                                    color: Colors.pink[300],
                                  ),),
                                  decoration:BoxDecoration(
                                    color: Colors.pink.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(7),
                                  )
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('$_split',style: TextStyle(
                                fontSize:22,
                                color: Colors.pink[500]
                              ),),
                            ),
                            InkWell(
                              onTap:(){
                                setState(() {
                                                                  _split++;

                                });
                                
                              },
                              child:Container(
                                alignment: Alignment.center,
                                height:30,
                                child: Text('+',style: TextStyle(color:Colors.pink[300]),),
                                width:30,
                                decoration:BoxDecoration(color: Colors.pink.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(7), )
                              ),
                            )
                          ]
                        ),
                        Row(
                          children:[
                            Text('Tip:   ',style:TextStyle(fontSize: 17 )),
                            Padding(
                              padding: const EdgeInsets.only(left:164.0),
                              child: Text('\$${calculateTip(_billAmount,_tipPercentage)}',style: TextStyle(
                                fontSize:22,
                                color: Colors.pink[500]
                              ),),
                            )

                          ]
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Column(
                            children: [
                              Text('$_tipPercentage%',style: TextStyle(
                                color:Colors.pink[500],
                                fontSize:17,
                              ),),
                              Slider(
                                min: 0,
                                max: 100,
                                activeColor: Colors.pink[400],
                                inactiveColor: Colors.pink[100].withOpacity(0.55),
                                value: _tipPercentage.toDouble(), 
                                onChanged: (double value){
                                setState(() {
                                  _tipPercentage=value.round();
                                });
                              }),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:[
                                       Column(
                                         children: [
                                           InkWell(
                                             onTap: (){
                                               setState(() {
                                                 _split=1;
                                               _tipPercentage=0;
                                               _billAmount=0;

                                               });
                                                                                            },
                                             child:Container(width: 52,height:52,
                                             margin: const EdgeInsets.only(left:12,right:12,top:12,bottom:2),
                                             decoration: BoxDecoration(color:Colors.pink[100].withOpacity(0.55),
                                             borderRadius: BorderRadius.circular(25),
                                             ),
                                             child: Icon(Icons.restore_page,color:Colors.pink[500]),
                                             )
                                           ),
                                           Text('Reset',style: TextStyle(fontWeight:FontWeight.bold),)
                                         ],
                                       ),
                                       Padding(padding: EdgeInsets.all(20)),
                                       Column(
                                         children: [
                                           InkWell(onTap: (){
                                             setState(() {
                                                _billAmount = calculateTotalbill(_billAmount, _split, _tipPercentage);
                                             });
                                             
                                           },
                                             child:Container(width: 52,height:52,
                                             
                                             margin: const EdgeInsets.only(left:12,right:12,top:12,bottom:2),
                                             decoration: BoxDecoration(color:Colors.pink[100].withOpacity(0.55),
                                             borderRadius: BorderRadius.circular(25),
                                             ),
                                             child: Icon(Icons.forward,color:Colors.pink[500]),
                                             )
                                           ),
                                           Text('Go',style: TextStyle(fontWeight:FontWeight.bold))
                                         ],
                                       ),
                                  ]
                              )
                            ],
                          ),
                        )
                        
                      ]
                    ),
                  )
            ],
          ),
            

        
      
    );
  }
  double calculateTip(double billAmount,int tipPerc){
    double totalTip=0.0;
      if(billAmount<0||billAmount.toString().isEmpty||billAmount==null){}
      else{
         totalTip =(billAmount*tipPerc) /100;
      }
      return totalTip;

  }
  double calculateTotalbill(double billAmount,int split,int tipPerc){
      double total=0.0;
      total = ((billAmount+(calculateTip(billAmount, tipPerc)))/split);
    return total;
  }


}
