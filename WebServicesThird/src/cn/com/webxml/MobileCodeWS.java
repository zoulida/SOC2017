

/**
 * MobileCodeWS.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis2 version: 1.7.4  Built on : Oct 21, 2016 (10:47:34 BST)
 */

    package cn.com.webxml;

    /*
     *  MobileCodeWS java interface
     */

    public interface MobileCodeWS {
          

        /**
          * Auto generated method signature
          * &lt;br /&gt;&lt;h3&gt;获得国内手机号码归属地省份、地区和手机卡类型信息&lt;/h3&gt;&lt;p&gt;输入参数：mobileCode = 字符串（手机号码，最少前7位数字），userID = 字符串（商业用户ID） 免费用户为空字符串；返回数据：字符串（手机号码：省份 城市 手机卡类型）。&lt;/p&gt;&lt;br /&gt;
                    * @param getMobileCodeInfo0
                
         */

         
                     public cn.com.webxml.GetMobileCodeInfoResponse getMobileCodeInfo(

                        cn.com.webxml.GetMobileCodeInfo getMobileCodeInfo0)
                        throws java.rmi.RemoteException
             ;

        
         /**
            * Auto generated method signature for Asynchronous Invocations
            * &lt;br /&gt;&lt;h3&gt;获得国内手机号码归属地省份、地区和手机卡类型信息&lt;/h3&gt;&lt;p&gt;输入参数：mobileCode = 字符串（手机号码，最少前7位数字），userID = 字符串（商业用户ID） 免费用户为空字符串；返回数据：字符串（手机号码：省份 城市 手机卡类型）。&lt;/p&gt;&lt;br /&gt;
                * @param getMobileCodeInfo0
            
          */
        public void startgetMobileCodeInfo(

            cn.com.webxml.GetMobileCodeInfo getMobileCodeInfo0,

            final cn.com.webxml.MobileCodeWSCallbackHandler callback)

            throws java.rmi.RemoteException;

     

        /**
          * Auto generated method signature
          * &lt;br /&gt;&lt;h3&gt;获得国内手机号码归属地数据库信息&lt;/h3&gt;&lt;p&gt;输入参数：无；返回数据：一维字符串数组（省份 城市 记录数量）。&lt;/p&gt;&lt;br /&gt;
                    * @param getDatabaseInfo2
                
         */

         
                     public cn.com.webxml.GetDatabaseInfoResponse getDatabaseInfo(

                        cn.com.webxml.GetDatabaseInfo getDatabaseInfo2)
                        throws java.rmi.RemoteException
             ;

        
         /**
            * Auto generated method signature for Asynchronous Invocations
            * &lt;br /&gt;&lt;h3&gt;获得国内手机号码归属地数据库信息&lt;/h3&gt;&lt;p&gt;输入参数：无；返回数据：一维字符串数组（省份 城市 记录数量）。&lt;/p&gt;&lt;br /&gt;
                * @param getDatabaseInfo2
            
          */
        public void startgetDatabaseInfo(

            cn.com.webxml.GetDatabaseInfo getDatabaseInfo2,

            final cn.com.webxml.MobileCodeWSCallbackHandler callback)

            throws java.rmi.RemoteException;

     

        
       //
       }
    