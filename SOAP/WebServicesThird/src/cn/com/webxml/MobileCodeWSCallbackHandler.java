
/**
 * MobileCodeWSCallbackHandler.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis2 version: 1.7.4  Built on : Oct 21, 2016 (10:47:34 BST)
 */

    package cn.com.webxml;

    /**
     *  MobileCodeWSCallbackHandler Callback class, Users can extend this class and implement
     *  their own receiveResult and receiveError methods.
     */
    public abstract class MobileCodeWSCallbackHandler{



    protected Object clientData;

    /**
    * User can pass in any object that needs to be accessed once the NonBlocking
    * Web service call is finished and appropriate method of this CallBack is called.
    * @param clientData Object mechanism by which the user can pass in user data
    * that will be avilable at the time this callback is called.
    */
    public MobileCodeWSCallbackHandler(Object clientData){
        this.clientData = clientData;
    }

    /**
    * Please use this constructor if you don't want to set any clientData
    */
    public MobileCodeWSCallbackHandler(){
        this.clientData = null;
    }

    /**
     * Get the client data
     */

     public Object getClientData() {
        return clientData;
     }

        
           /**
            * auto generated Axis2 call back method for getMobileCodeInfo method
            * override this method for handling normal response from getMobileCodeInfo operation
            */
           public void receiveResultgetMobileCodeInfo(
                    cn.com.webxml.GetMobileCodeInfoResponse result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from getMobileCodeInfo operation
           */
            public void receiveErrorgetMobileCodeInfo(java.lang.Exception e) {
            }
                
           /**
            * auto generated Axis2 call back method for getDatabaseInfo method
            * override this method for handling normal response from getDatabaseInfo operation
            */
           public void receiveResultgetDatabaseInfo(
                    cn.com.webxml.GetDatabaseInfoResponse result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from getDatabaseInfo operation
           */
            public void receiveErrorgetDatabaseInfo(java.lang.Exception e) {
            }
                


    }
    