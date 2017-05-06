

/**
 * MyService.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis2 version: 1.7.4  Built on : Oct 21, 2016 (10:47:34 BST)
 */

    package com;

    /*
     *  MyService java interface
     */

    public interface MyService {
          

        /**
          * Auto generated method signature
          * 
                    * @param sayHello0
                
         */

         
                     public com.SayHelloResponse sayHello(

                        com.SayHello sayHello0)
                        throws java.rmi.RemoteException
             ;

        
         /**
            * Auto generated method signature for Asynchronous Invocations
            * 
                * @param sayHello0
            
          */
        public void startsayHello(

            com.SayHello sayHello0,

            final com.MyServiceCallbackHandler callback)

            throws java.rmi.RemoteException;

     

        
       //
       }
    