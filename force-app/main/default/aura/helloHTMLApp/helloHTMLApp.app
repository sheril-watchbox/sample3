<aura:application extends="force:slds" >
    <!-- <c:helloHTML/> -->
    <!--<c:AttributeEg></c:AttributeEg> -->
    <!-- <c:auraMethodCaller /> -->
    
    <!--In Bound Component & Out Bound Component -->
    <!-- <aura:attribute name="parentAttr" type="String" default="parent attribute"/>
    <c:ExpressionType childAttr="{#v.parentAttr}" />
    Parent :  {!v.parentAttr} -->
    <!--In Bound Component & Out Bound Component -->
    <!-- $Browser.formFactor() in controller
  {!$Browser.formFactor()} -->
    <!-- <aura:handler name='init' value="{!this}" action="{!c.callInit}"/>-->
    <!--Content Asset -->
    <!--<img src="{!$ContentAsset.websiteImages+'pathinarchive=images/logo.jpg'}" alt="Holiday"></img>  
    <ltng:require styles="{!$ContentAsset.bookStyle}"></ltng:require> --> 
    {!$Locale.language}
    {!$Locale.currencyFormat}
    
    <p>{!add(1,2)}</p>
    <p>{!sub(2,1)}</p>
    <p>{!concat('Hello ', 'world')}</p>
    
    <lightning:tabset>
        <lightning:tab label="Tab 1">Hello World</lightning:tab>
        <lightning:tab label="Tab 2">Hello Tes</lightning:tab>
    </lightning:tabset>
    
    <c:orange>
        Test Body
        <aura:set attribute="header"> Header</aura:set>
    </c:orange>
    
</aura:application>