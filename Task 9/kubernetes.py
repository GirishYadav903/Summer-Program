#!/usr/bin/python3
import subprocess 
import cgi

print("content-type: text/html")
print()

f=cgi.FieldStorage()
cmd=f.getvalue("k")
port=f.getvalue("port")
expose_type=f.getvalue("expose_type")
replica=f.getvalue("replica")
image=f.getvalue("image")
dname=f.getvalue("dname")
pname=f.getvalue("pname")
svc=f.getvalue("svc")
port=f.getvalue("port")
# cmd = cmd.split()
# type(port)
# print(cmd)

if(("all" in cmd) or ("number" in cmd) or ("no." in cmd) or ("show" in cmd)) and (("pods" in cmd) or ("pod" in cmd) or ("Pod" in cmd)):
    output=subprocess.getoutput("kubectl get pods --kubeconfig admin.conf")
    # print("<body style ='padding: 40px;'>")
    # print('<h1 style="color: #df405a ; " >OUTPUT</h1>')
    print("{}".format(output))
    # print("</body>")
    
elif(("create" in cmd)) and (("pods" in cmd) or ("pod" in cmd) or ("Pod" in cmd) or ("deployments" in cmd) or ("deployment" in cmd)):
    output=subprocess.getoutput("kubectl create deployment {0} --image={1}  --kubeconfig admin.conf".format(dname, image))
    # print("<body style ='padding: 40px;'>")
    # print('<h1 style="color: #df405a ; " >OUTPUT</h1>')
    print("{}".format(output))
    # print("</body>")
elif(("all" in cmd) or ("show" in cmd) ) and (("deployments" in cmd) or ("Deployments" in cmd) or ("deployment" in cmd)):
    output=subprocess.getoutput("kubectl get deployment  --kubeconfig admin.conf")    
    # print("<body style ='padding; 40px;'>")
    # print('<h1 style="color: #df405a ; " >OUTPUT</h1>')
    print("{}".format(output))
    # print("</body>")

elif(("create" in cmd) or ("launch" in cmd) or ("form" in cmd) or ("run" in cmd) or ("run" in cmd)) and (("pod" in cmd) or ("pods" in cmd)):
    output=subprocess.getoutput("kubectl run {0} --image={1}  --kubeconfig admin.conf".format(pname, image))
    # print("<body style ='padding; 40px;'>")
    # print('<h1 style="color: #df405a ; " >OUTPUT</h1>')
    print("{}".format(output))
    # print("</body>")

elif(("create" in cmd) or ("launch" in cmd)) and (("deployments" in cmd) or ("deployment" in cmd)):
    output=subprocess.getoutput("kubectl create deployment {0} --image={1}  --kubeconfig admin.conf".format(dname, image))
    #print("<body style ='padding; 40px;'>")
    #print('<h1 style="color: #df405a ; " >OUTPUT</h1>')
    print("{}".format(output))
    #print("</body>")

elif ("expose" in cmd) and ("deployment" in cmd):
    output=subprocess.getoutput("kubectl expose deployment {0} --port={1} --type={2}  --kubeconfig admin.conf".format(dname, port, expose_type))
    #print("<body style ='padding; 40px;'>")
    #print('<h1 style="color: #df405a ; " >OUTPUT</h1>')
    print("{}".format(output))
    #print("</body>")

elif (("create" in cmd) or ("scale" in cmd) or ("replica" in cmd)) and ("deployment" in cmd):
    output=subprocess.getoutput("kubectl scale deployment {0} --replicas={1}  --kubeconfig admin.conf".format(dname,replica))
    #print("<body style ='padding; 40px;'>")
    #print('<h1 style="color: #df405a ; " >OUTPUT</h1>')
    print("{}".format(output))
    #print("</body>")

elif (("delete" in cmd ) or ("remove" in cmd )) and ("deployment" in cmd):
    output=subprocess.getoutput("kubectl delete  deployment {0}  --kubeconfig admin.conf".format(dname))
    #print("<body style ='padding; 40px;'>")
    #print('<h1 style="color: #df405a ; " >OUTPUT</h1>')
    print("{}".format(output))
    #print("</body>")

elif (("delete" in cmd ) or ("remove" in cmd )) and ("services" in cmd):
    output=subprocess.getoutput("kubectl delete services {0}  --kubeconfig admin.conf".format(svc))
    #print("<body style ='padding; 40px;'>")
    #print('<h1 style="color: #df405a ; " >OUTPUT</h1>')
    print("{}".format(output))
    #print("</body>")

elif (("delete" in cmd ) or ("remove" in cmd )) and ("pods" in cmd):
    output=subprocess.getoutput("kubectl delete  pods {0}  --kubeconfig admin.conf".format(pname))
    #print("<body style ='padding; 40px;'>")
    #print('<h1 style="color: #df405a ; " >OUTPUT</h1>')
    print("{}".format(output))
    #print("</body>")

elif (("show" in cmd ) or ("list" in cmd )) and (("services" in cmd) or ("svc" in cmd)):
    output=subprocess.getoutput("kubectl get services  --kubeconfig admin.conf")
    #print("<body style ='padding; 40px;'>")
    #print('<h1 style="color: #df405a ; " >OUTPUT</h1>')
    print("{}".format(output))
    #print("</body>")

elif (("all" in cmd ) or ("whole" in cmd ) or ("environment" in cmd)) and (("delete" in cmd) or ("destroy" in cmd)):
    output=subprocess.getoutput("kubectl delete --all all  --kubeconfig admin.conf")
    #print("<body style ='padding; 40px;'>")
    #print('<h1 style="color: #df405a ; " >OUTPUT</h1>')
    print("{}".format(output))
    print("Environment Deleted......")
    #print("</body>")
else:

    #print("<body style ='padding; 40px;'>")
    #print('<h1 style="color: #df405a ; " >OUTPUT</h1>')
    print("Invalid commands")
    print("{}".format("Please type the Kubernetes Commands only !!"))
    #print("</body>")
